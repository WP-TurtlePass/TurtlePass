import java.time.Instant;
import java.util.*;
import kr.ac.siheung.tourpass.service.PassService;
public class BoundaryCheck {
  public static void main(String[] args){
    var p=new HashMap<String,Object>();p.put("startsAt","2026-10-03T00:00:00Z");p.put("expiresAt","2026-10-04T00:00:00Z");
    var b=new HashMap<String,Object>();b.put("merchantActive",true);b.put("benefitActive",true);b.put("remainingCount",1);
    assert PassService.status(p,Instant.parse("2026-10-02T23:59:59.999999Z")).equals("NOT_STARTED");
    assert PassService.availability(p,b,Instant.parse("2026-10-03T00:00:00Z")).equals("AVAILABLE");
    assert PassService.availability(p,b,Instant.parse("2026-10-03T23:59:59.999999Z")).equals("AVAILABLE");
    assert PassService.availability(p,b,Instant.parse("2026-10-04T00:00:00Z")).equals("PASS_EXPIRED");
    p.put("cancelledAt","2026-10-03T01:00:00Z");assert PassService.status(p,Instant.parse("2026-10-05T00:00:00Z")).equals("CANCELLED");
    b.put("merchantActive",false);assert PassService.availability(p,b,Instant.now()).equals("MERCHANT_INACTIVE");
    System.out.println("PASS: start/end boundaries and cancellation/merchant precedence");
  }
}
