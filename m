Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C7D7AA2A
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 15:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ECB6E520;
	Tue, 30 Jul 2019 13:51:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sonic314-19.consmr.mail.ir2.yahoo.com
 (sonic314-19.consmr.mail.ir2.yahoo.com [77.238.177.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4128A6E514
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 13:34:11 +0000 (UTC)
X-YMail-OSG: 7PkLrkYVM1n.7Y814GtRJKN3KIrb7k5FJJ68OStwP7WUa.02Jn1w0TbJ1njwocl
 0F0E_A3tcpiNlllNcZbtsU6VL3clrxWAjW8_2D.tBXOEPChG1w4Md17oAUbQilgRvof3WGFDDsdE
 IY7EIP7nj5ZDNQ31MHGtd2wsp8LIOlzpeCVIviMA2D9Ib5X3L73LIcYXg1Kl_0Iy3mRmhbCQaCSD
 S_gImbjFkc5nVeYPh2MY5iqlc_UhIVZl8gTEWDquBOMie16.sVvKIUSIgD.eMQkEI_LMantbp7T2
 xTysKSpn1vInrcLq7bmjWWPsTbuAmEy.iSkTmmXdDef07M2RqVL3lgG21WDMhV8pWJRtH0FreFgh
 Y2kbfi1DTyWGbIA8zdeEF8jOI.s4Ibzjags7.Ohjhg1rH2PhFVXOiwQDfGjJj6IqcEucCtxKU2JH
 RX_Q0x7WsIj6io.XPUDMNPHiQCDa2Yr6rlPwqHtJlEgt6u99eCwl5_A9LJovFH._4yFKI1Xog1l3
 j9v48n25N.KiOA97n9DG5c8LOwc5jb02g5IkitkbnORORC.fslM.LHU5TiPAibt4dHD1tL56is88
 lZg8scBKhciUBJXiY2mOSCXS5uAtpkGWbZVSzVgxrNIKjpnbNiPXvqkvmqwlpAxkOcgdpGU2R4Pi
 IDAO7yXaXHBzP5IObweRXhtlF87i_UXXaedKyN2uy85v6AHdZKzzVNdwHhdO4ePjlP.Y_3PHYSlz
 aF0sTbWnjo8zRO50kcx_pLHPgsGkmNqUFotGWmLjF5k4zIJRLolXJe5VJqYXHeqp07we9A_qQOhM
 k.ixN2b_8bAVA_YJ8sc77cD76ARB8QTG5i8XMa5EqtlE6cUNPOAOl..3KhyIFc7tXf62wyCcCGAy
 rJnjU2Li1mYavmCfklW6na252HZ8zspNyps7Eo0X5SWiD_2ouev41IEgZvOCTrEWpbK0Semjkhd_
 QVnrD5f5cuwdEQKVmxDAuEop6pjtSCembZKJJLjj87solGGfNg0HOCaMGFnCVBRM5g7itBv6B0Iu
 otDUh0Ls4ssqU7i3oSsAkVsHisbmipCQqvOm8KZyHj_P8qnk3prLEkbrR32BmFXxSooXoXz6E.Bj
 DIJzcLxeYNZY8X4G4SuBYAPfnoTTQH0Rud9p7cfC6cXgOhdjYTY9L4krnz.zwiTm3arJiI9SoPZy
 a.4nxulxSibaSCbU5Z1lahgZJ8jN57.tSB8Uc68Dij6KuzxQedi1bDqJ3ZGcBcSP9
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ir2.yahoo.com with HTTP; Tue, 30 Jul 2019 13:34:08 +0000
Received: by smtp427.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 0565a8f39f2d555611f9dab3806193c7; 
 Tue, 30 Jul 2019 13:34:05 +0000 (UTC)
From: Paul Gover <pmw.gover@yahoo.co.uk>
To: Likun.Gao@amd.com
Subject: AMDPU breaks suspend after kernel 5.0
Date: Tue, 30 Jul 2019 14:34:04 +0100
Message-ID: <1857879.T0pfAYGBzp@acer>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jul 2019 13:51:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.co.uk; s=s2048; t=1564493648;
 bh=6G7/rKbhCSbtfKUuwfkTCrluQtgX365TagD5bftf2U4=;
 h=From:To:Cc:Subject:Date:From:Subject;
 b=QUpqLJGLoEmKpjVB7/QyPfR/G+Ap7iCAd1cW8ysi27hw5kb1jQvQjs51w4ZAjniobARN31D4zrUM0slZ01oEqicaPzkSKF+H2S93CFN+nAc0qw63SM8j//a3M5KPkou2a8V4Ea3jyMPouVI3nRxS+3xh0yom3LAnw7O3rvnv7nYyQZoAouCGgNdmquSfxW4UHVE32Gxq8aDIBkyTQyP54N6C6VKID4f7Xsl5dIrUnZzmAMNF0NkeuDbnbgwUBYQ6Zk39ImbLajsuMcFIO2Iqp/Y+ART4qzR738V1zIJRC/wI7GNpi9mUNO+kK7CGWZi9vXDfg8BPglAg1zl65Sgn/g==
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
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgTGlrdW4sCgpTb3JyeSBpZiB5b3UgZG9uJ3Qgd2FudCBlbWFpbHMgbGlrZSB0aGlzLiAgSSBh
ZGRlZCBpbmZvLiB0bwpodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9p
ZD0xMTAyNTgKYnV0IHBlb3BsZSBvbiBHZW50b28gZm9ydW1zIHNhaWQgZW1haWwgd291bGQgYmUg
YmV0dGVyLgoKR2l0IGJpc2VjdCBsZWFkIG1lIHRvIHlvdToKLS0tLS0tLS0tLS0tLS0tCjEwNmM3
ZDYxNDhlNWFhZGQzOTRlNjcwMWY3ZTQ5OGRmNDliODY5ZDEgaXMgdGhlIGZpcnN0IGJhZCBjb21t
aXQKY29tbWl0IDEwNmM3ZDYxNDhlNWFhZGQzOTRlNjcwMWY3ZTQ5OGRmNDliODY5ZDEKQXV0aG9y
OiBMaWt1biBHYW8gPExpa3VuLkdhb0BhbWQuY29tPgpEYXRlOiAgIFRodSBOb3YgOCAyMDoxOTo1
NCAyMDE4ICswODAwCgogICAgZHJtL2FtZGdwdTogYWJzdHJhY3QgdGhlIGZ1bmN0aW9uIG9mIGVu
dGVyL2V4aXQgc2FmZSBtb2RlIGZvciBSTEMKICAgIAogICAgQWJzdHJhY3QgdGhlIGZ1bmN0aW9u
IG9mIGFtZGdwdV9nZnhfcmxjX2VudGVyL2V4aXRfc2FmZV9tb2RlIGFuZCBzb21lIHBhcnQgCm9m
IHJsY19pbml0IHRvIGltcHJvdmUgdGhlIHJldXNhYmlsaXR5IG9mIFJMQy4KICAgIAogICAgU2ln
bmVkLW9mZi1ieTogTGlrdW4gR2FvIDxMaWt1bi5HYW9AYW1kLmNvbT4KICAgIEFja2VkLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CiAgICBSZXZpZXdlZC1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgogICAgU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKOjA0MDAwMCAw
NDAwMDAgOGYzYjM2NTQ5NmYzYmJkMzgwYTYyMDMyZjIwNjQyYWNlNTFjOGZlZiAKZTE0ZWM5Njgw
MTEwMTllM2Y2MDFkZjNmMTU2ODJiYjlhZTBiYWZjNiBNICAgICAgZHJpdmVycwotLS0tLS0tLS0t
LS0tLS0tLS0tLS0KU3ltcHRvbXMgYXJlIHdoZW4gcmVzdW1pbmcgYWZ0ZXIgcG0tc3VzcGVuZCwg
dGhlIHNjcmVlbiBpcyBibGFuayBvciBjb3JydXB0LAp0aGUga2V5Ym9hcmQgZGVhZCwgYW5kIHN5
c2xvZyBzaG93cwotLS0tLS0tLS0tLS0tLS0tLS0tLQprZXJuZWw6IFsgICA4MS4wOTY2NjZdIFtk
cm06YW1kZ3B1X2pvYl90aW1lZG91dF0gKkVSUk9SKiByaW5nIGdmeCB0aW1lb3V0LCAKc2lnbmFs
ZWQgc2VxPTUxLCBlbWl0dGVkIHNlcT01MgprZXJuZWw6IFsgICA4MS4wOTY2NzFdIFtkcm1dIElQ
IGJsb2NrOmdmeF92OF8wIGlzIGh1bmchCmtlcm5lbDogWyAgIDgxLjA5NjczNF0gW2RybV0gR1BV
IHJlY292ZXJ5IGRpc2FibGVkLgotLS0tLS0tLS0tLS0tLS0tLS0tLS0Kb3Igc2ltaWxhci4gIFRo
ZSBwcm9ibGVtIG9jY3VycyB3aXRoIGFsbCBrZXJuZWxzIHNpbmNlIDUuMCB1cCB0byBhbmQgaW5j
bHVkaW5nIAo1LjMtcmMyLiAgTXkgbGFwdG9wIGlzOgoKSFAgMTUtYncweHgKY3B1OkFNRCBBOS05
NDIwIFJBREVPTiBSNSwgNSBDT01QVVRFIENPUkVTIDJDKzNHCndpdGggaW50ZWdyYXRlZCBncmFw
aGljczoKU3RvbmV5IFtSYWRlb24gUjIvUjMvUjQvUjUgR3JhcGhpY3NdIFsxMDAyOjk4RTRdCgpU
aGVyZSBhcmUgc2V2ZXJhbCBzaW1pbGFyIHJlcG9ydHMgb24gdGhlIHdlYiwgbW9zdCBvciBhbGwg
Zm9yIFN0b25leSBoYXJkd2FyZSwgCmJ1dCB0aGF0IG1pZ2h0IGJlIGEgY29pbmNpZGVuY2UgYXMg
bGFwdG9wIHVzZXJzIGFyZSBtb3JlIGNvbmNlcm5lZCBhYm91dCAKc3VzcGVuZCwgYW5kIHRoZXJl
IGFyZSBhIGxvdCBvZiBsYXB0b3BzIHdpdGggc2ltaWxhciBpbnRlZ3JhdGVkIGdyYXBoaWNzIApt
b3RoZXJib2FyZHMuCgpJJ20gcnVubmluZyBHZW50b28gd2l0aCBhIGN1c3RvbSBrZXJuZWwsIHRo
ZSBtb3N0IHJlbGV2YW50IGJpdHMgb2YgdGhlIGNvbmZpZwpDT05GSUdfRFJNX0FNREdQVT15CiMg
Q09ORklHX0RSTV9BTURHUFVfU0kgaXMgbm90IHNldAojIENPTkZJR19EUk1fQU1ER1BVX0NJSyBp
cyBub3Qgc2V0CiMgQ09ORklHX0RSTV9BTURHUFVfVVNFUlBUUiBpcyBub3Qgc2V0CgpJZiB5b3Ug
dGVsbCBtZSBob3csIEknbSB3aWxsaW5nIHRvIHRyeSB0byBjb2xsZWN0IHRyYWNlcyBldGMuCgpQ
YXVsIEdvdmVyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
