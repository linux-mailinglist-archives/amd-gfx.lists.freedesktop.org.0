Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0819BE7780
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Oct 2019 18:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859B06E0C1;
	Mon, 28 Oct 2019 17:21:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 966 seconds by postgrey-1.36 at gabe;
 Mon, 28 Oct 2019 17:18:01 UTC
Received: from mail.monssa.com.ar (mail.monssa.com.ar [190.3.107.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98536E0C1
 for <amd-gfx@lists.freedesktop.org>; Mon, 28 Oct 2019 17:18:01 +0000 (UTC)
Received: from [10.10.0.77] (port=51430)
 by mail.monssa.com.ar with esmtp (Exim 4.89)
 (envelope-from <debian@monssa.com.ar>) id 1iP8Ot-0006KY-7x
 for amd-gfx@lists.freedesktop.org; Mon, 28 Oct 2019 14:01:51 -0300
To: amd-gfx@lists.freedesktop.org
From: MONSSA <debian@monssa.com.ar>
Subject: Can't get VGA video on Carrizo R7 gpu, only HDMI
Message-ID: <bad3aed9-65f7-7166-3404-5d1d5687eaf0@monssa.com.ar>
Date: Mon, 28 Oct 2019 14:01:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Score: -2.0
X-Spam-Report: Spam detection software,
 running on the system "bird.servers.monssa.com.ar", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello. This is my first time trying to report a bug, I hope
 I'm in the right place. I have a PC with MSI A68HM-E33 V2 motherboard, and
 AMD A8-7680 CPU with Radeon R7. I'm running Debian 9 Stretch,
 Kernel~4.19.0-0.bpo.6-amd64, 
 using amdgpu driver, and I get video only on the HDMI output. 
 Content analysis details:   (-2.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 NO_DNS_FOR_FROM        DNS: Envelope sender has no MX or A DNS records
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
 [score: 0.0000]
 0.9 DKIM_ADSP_NXDOMAIN     No valid author signature and domain not in
 DNS
X-Spam-Level: --
X-Mailman-Approved-At: Mon, 28 Oct 2019 17:21:13 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGVsbG8uIFRoaXMgaXMgbXkgZmlyc3QgdGltZSB0cnlpbmcgdG8gcmVwb3J0IGEgYnVnLCBJIGhv
cGUgSSdtIGluIHRoZSAKcmlnaHQgcGxhY2UuCgpJIGhhdmUgYSBQQyB3aXRoIE1TSSBBNjhITS1F
MzMgVjIgbW90aGVyYm9hcmQsIGFuZCBBTUQgQTgtNzY4MCBDUFUgd2l0aCAKUmFkZW9uIFI3LgoK
SSdtIHJ1bm5pbmcgRGViaWFuIDkgU3RyZXRjaCwgS2VybmVsfjQuMTkuMC0wLmJwby42LWFtZDY0
LCB1c2luZyBhbWRncHUgCmRyaXZlciwgYW5kIEkgZ2V0IHZpZGVvIG9ubHkgb24gdGhlIEhETUkg
b3V0cHV0LgoKeHJhbmRyIG9ubHkgbGlzdHMgdGhlIEhETUkgb3V0cHV0IGFzIGNvbm5lY3RlZCwg
YW5kIGEgRFZJIG91dHB1dCAKZGlzY29ubmVjdGVkLiBUaGUgbW90aGVyYm9hcmQgZG9lc24ndCBo
YXZlIERWSSBjb25uZWN0b3IsIG9ubHkgVkdBIGFuZCBIRE1JLgoKSSB0cmllZCBmb3JjaW5nIHZp
ZGVvIG91dHB1dCBvbiB0aGUgRFZJIGludGVyZmFjZSwgYnV0IEkgZGlkbid0IGdldCBhbnkgCnZp
ZGVvIG9uIFZHQSBwb3J0LCBldmVuIHRob3VnaCB0aGUgZGVza3RvcCB3YXMgYXJyYW5nZWQgdG8g
c3ByZWFkIGFjcm9zcyAKYm90aCBzY3JlZW5zLgoKSSB0cmllZCBzZXZlcmFsIG9wdGlvbnMgZm9y
IHRoZSBrZXJuZWwgbW9kdWxlLCBzdWNoIGFzICJleHBfaHdfc3VwcG9ydCIgCmFuZCAiY2lrX3N1
cHBvcnQiIGRpZG4ndCBmdWxseSBrbm93aW5nIHdoYXQgdGhleSBkaWQsIHRvIG5vIGF2YWlsLgoK
T2YgY291cnNlIEkgaGF2ZSB0d28gbW9uaXRvcnMgcGx1Z2dlZCBpbiB0byBib3RoIGNvbm5lY3Rv
cnMsIGFuZCBJIHJ1bGVkIApvdXQgaGFyZHdhcmUgcHJvYmxlbXMgKHN1Y2ggYXMgYnVybmVkIGNv
bm5lY3RvcikgYmVjYXVzZSBJIGNoYW5nZWQgdGhlIApIREQgYW5kIGluc3RhbGxlZCB3aW5kb3dz
LCB3aXRoIHRoZSBvZmZpY2lhbCBBTUQgd2luZG93cyBkcml2ZXJzIEkgZ2V0IAp2aWRlbyB3b3Jr
aW5nIGZpbmUgb24gYm90aCBtb25pdG9ycywgc28gbW9uaXRvcnMsIGNhYmxlcyBhbmQgcG9ydHMg
YXJlIAp3b3JraW5nLgoKVGhlIG1vdGhlcmJvYXJkIGhhcyB0aGUgbGF0ZXN0IEJJT1MgYXZhaWxh
YmxlLgoKVGhhbmtzIGluIGFkdmFuY2UgZm9yIGFueSBoZWxwLgoKSGVyZSBpcyBzb21lIGluZm8s
IHRlbGwgbWUgaWYgeW91IG5lZWQgYW55IG1vcmU6CgowMDowMS4wIFZHQSBjb21wYXRpYmxlIGNv
bnRyb2xsZXI6IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4gCltBTUQvQVRJXSBDYXJyaXpv
IChyZXYgZTIpIChwcm9nLWlmIDAwIFtWR0EgY29udHJvbGxlcl0pCiDCoMKgwqAgU3Vic3lzdGVt
OiBNaWNyby1TdGFyIEludGVybmF0aW9uYWwgQ28uLCBMdGQuIFtNU0ldIFdhbmkgW1JhZGVvbiAK
UjUvUjYvUjcgR3JhcGhpY3NdCiDCoMKgwqAgQ29udHJvbDogSS9PKyBNZW0rIEJ1c01hc3Rlcisg
U3BlY0N5Y2xlLSBNZW1XSU5WLSBWR0FTbm9vcC0gUGFyRXJyLSAKU3RlcHBpbmctIFNFUlItIEZh
c3RCMkItIERpc0lOVHgrCiDCoMKgwqAgU3RhdHVzOiBDYXArIDY2TUh6LSBVREYtIEZhc3RCMkIt
IFBhckVyci0gREVWU0VMPWZhc3QgPlRBYm9ydC0gCjxUQWJvcnQtIDxNQWJvcnQtID5TRVJSLSA8
UEVSUi0gSU5UeC0KIMKgwqDCoCBMYXRlbmN5OiAwLCBDYWNoZSBMaW5lIFNpemU6IDY0IGJ5dGVz
CiDCoMKgwqAgSW50ZXJydXB0OiBwaW4gQSByb3V0ZWQgdG8gSVJRIDM2CiDCoMKgwqAgUmVnaW9u
IDA6IE1lbW9yeSBhdCBjMDAwMDAwMCAoNjQtYml0LCBwcmVmZXRjaGFibGUpIFtzaXplPTI1Nk1d
CiDCoMKgwqAgUmVnaW9uIDI6IE1lbW9yeSBhdCBkMDAwMDAwMCAoNjQtYml0LCBwcmVmZXRjaGFi
bGUpIFtzaXplPThNXQogwqDCoMKgIFJlZ2lvbiA0OiBJL08gcG9ydHMgYXQgZjAwMCBbc2l6ZT0y
NTZdCiDCoMKgwqAgUmVnaW9uIDU6IE1lbW9yeSBhdCBmZWIwMDAwMCAoMzItYml0LCBub24tcHJl
ZmV0Y2hhYmxlKSBbc2l6ZT0yNTZLXQogwqDCoMKgIEV4cGFuc2lvbiBST00gYXQgMDAwYzAwMDAg
W2Rpc2FibGVkXSBbc2l6ZT0xMjhLXQogwqDCoMKgIENhcGFiaWxpdGllczogWzQ4XSBWZW5kb3Ig
U3BlY2lmaWMgSW5mb3JtYXRpb246IExlbj0wOCA8Pz4KIMKgwqDCoCBDYXBhYmlsaXRpZXM6IFs1
MF0gUG93ZXIgTWFuYWdlbWVudCB2ZXJzaW9uIDMKIMKgwqDCoCDCoMKgwqAgRmxhZ3M6IFBNRUNs
ay0gRFNJLSBEMSsgRDIrIEF1eEN1cnJlbnQ9MG1BIApQTUUoRDAtLEQxKyxEMissRDNob3QrLEQz
Y29sZC0pCiDCoMKgwqAgwqDCoMKgIFN0YXR1czogRDAgTm9Tb2Z0UnN0LSBQTUUtRW5hYmxlLSBE
U2VsPTAgRFNjYWxlPTAgUE1FLQogwqDCoMKgIENhcGFiaWxpdGllczogWzU4XSBFeHByZXNzICh2
MikgUm9vdCBDb21wbGV4IEludGVncmF0ZWQgRW5kcG9pbnQsIApNU0kgMDAKIMKgwqDCoCDCoMKg
wqAgRGV2Q2FwOsKgwqDCoCBNYXhQYXlsb2FkIDI1NiBieXRlcywgUGhhbnRGdW5jIDAKIMKgwqDC
oCDCoMKgwqAgwqDCoMKgIEV4dFRhZysgUkJFKwogwqDCoMKgIMKgwqDCoCBEZXZDdGw6wqDCoMKg
IFJlcG9ydCBlcnJvcnM6IENvcnJlY3RhYmxlLSBOb24tRmF0YWwtIEZhdGFsLSAKVW5zdXBwb3J0
ZWQtCiDCoMKgwqAgwqDCoMKgIMKgwqDCoCBSbHhkT3JkKyBFeHRUYWcrIFBoYW50RnVuYy0gQXV4
UHdyLSBOb1Nub29wKwogwqDCoMKgIMKgwqDCoCDCoMKgwqAgTWF4UGF5bG9hZCAxMjggYnl0ZXMs
IE1heFJlYWRSZXEgNTEyIGJ5dGVzCiDCoMKgwqAgwqDCoMKgIERldlN0YTrCoMKgwqAgQ29yckVy
ci0gVW5jb3JyRXJyLSBGYXRhbEVyci0gVW5zdXBwUmVxLSBBdXhQd3ItIApUcmFuc1BlbmQtCiDC
oMKgwqAgwqDCoMKgIERldkNhcDI6IENvbXBsZXRpb24gVGltZW91dDogTm90IFN1cHBvcnRlZCwg
VGltZW91dERpcy0sIExUUi0sIApPQkZGIE5vdCBTdXBwb3J0ZWQKIMKgwqDCoCDCoMKgwqAgRGV2
Q3RsMjogQ29tcGxldGlvbiBUaW1lb3V0OiA1MHVzIHRvIDUwbXMsIFRpbWVvdXREaXMtLCBMVFIt
LCAKT0JGRiBEaXNhYmxlZAogwqDCoMKgIENhcGFiaWxpdGllczogW2EwXSBNU0k6IEVuYWJsZSsg
Q291bnQ9MS8xIE1hc2thYmxlLSA2NGJpdCsKIMKgwqDCoCDCoMKgwqAgQWRkcmVzczogMDAwMDAw
MDBmZWUwMDAwMMKgIERhdGE6IDAwMDAKIMKgwqDCoCBDYXBhYmlsaXRpZXM6IFsxMDAgdjFdIFZl
bmRvciBTcGVjaWZpYyBJbmZvcm1hdGlvbjogSUQ9MDAwMSBSZXY9MSAKTGVuPTAxMCA8Pz4KIMKg
wqDCoCBDYXBhYmlsaXRpZXM6IFsyNzAgdjFdICMxOQogwqDCoMKgIENhcGFiaWxpdGllczogWzJi
MCB2MV0gQWRkcmVzcyBUcmFuc2xhdGlvbiBTZXJ2aWNlIChBVFMpCiDCoMKgwqAgwqDCoMKgIEFU
U0NhcDrCoMKgwqAgSW52YWxpZGF0ZSBRdWV1ZSBEZXB0aDogMDAKIMKgwqDCoCDCoMKgwqAgQVRT
Q3RsOsKgwqDCoCBFbmFibGUrLCBTbWFsbGVzdCBUcmFuc2xhdGlvbiBVbml0OiAwMAogwqDCoMKg
IENhcGFiaWxpdGllczogWzJjMCB2MV0gUGFnZSBSZXF1ZXN0IEludGVyZmFjZSAoUFJJKQogwqDC
oMKgIMKgwqDCoCBQUklDdGw6IEVuYWJsZSsgUmVzZXQtCiDCoMKgwqAgwqDCoMKgIFBSSVN0YTog
UkYtIFVQUkdJLSBTdG9wcGVkKwogwqDCoMKgIMKgwqDCoCBQYWdlIFJlcXVlc3QgQ2FwYWNpdHk6
IDAwMDAwMDIwLCBQYWdlIFJlcXVlc3QgQWxsb2NhdGlvbjogMDAwMDAwMjAKIMKgwqDCoCBDYXBh
YmlsaXRpZXM6IFsyZDAgdjFdIFByb2Nlc3MgQWRkcmVzcyBTcGFjZSBJRCAoUEFTSUQpCiDCoMKg
wqAgwqDCoMKgIFBBU0lEQ2FwOiBFeGVjLSBQcml2LSwgTWF4IFBBU0lEIFdpZHRoOiAxMAogwqDC
oMKgIMKgwqDCoCBQQVNJREN0bDogRW5hYmxlKyBFeGVjLSBQcml2LQogwqDCoMKgIEtlcm5lbCBk
cml2ZXIgaW4gdXNlOiBhbWRncHUKIMKgwqDCoCBLZXJuZWwgbW9kdWxlczogYW1kZ3B1CgoKLS0g
Ckp1bGnDoW4gTWV0ZWxza2kKRGVwYXJ0YW1lbnRvIElUCk1vbml0b3JpbmcgU3RhdGlvbiBTLkEu
CkNhbGxlIDQ4IG7CsCA4MTIKTGEgUGxhdGEgKEIxOTAwQUhOKSAtIEJBIC0gQVJHClRlbC9GYXg6
ICgrNTQpIDIyMSA0MjUgMzM1NQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
