Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5082051915
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 18:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4A589CE3;
	Mon, 24 Jun 2019 16:54:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1150F89C83;
 Mon, 24 Jun 2019 16:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 67E092AA11D;
 Mon, 24 Jun 2019 18:54:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id scSzJyteFz_N; Mon, 24 Jun 2019 18:54:08 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 562A12A604B;
 Mon, 24 Jun 2019 18:54:07 +0200 (CEST)
Received: from daenzer by thor with local (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hfSEI-0003ZY-Ga; Mon, 24 Jun 2019 18:54:06 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH libdrm 0/9] amdgpu: 
Date: Mon, 24 Jun 2019 18:53:57 +0200
Message-Id: <20190624165406.13682-1-michel@daenzer.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+CgpUaGUgbW90aXZh
dGlvbiBmb3IgdGhlc2UgcGF0Y2hlcyBpcyBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnLzEx
MDkwMyAuCgpQYXRjaGVzIDEtMyBhcmUgcHJlcGFyYXRvcnkuCgpQYXRjaGVzIDQgJiA1IGFyZSB0
aGUgY29yZSBwYXRjaGVzIGFsbG93aW5nIHRoZSBpc3N1ZXMgZGlzY3Vzc2VkIGluIHRoZQpidWcg
cmVwb3J0IHRvIGJlIGZpeGVkLgoKUGF0Y2hlcyA2LTggYXJlIGZ1cnRoZXIgb3B0aW1pemF0aW9u
cyAvIGNsZWFudXBzLgoKUGF0Y2ggOSBpcyB0aGUgTWVzYSBwYXRjaCBtYWtpbmcgdXNlIG9mIHRo
ZSBuZXcKYW1kZ3B1X2JvX2hhbmRsZV90eXBlX2ttc191c2VyIEFQSSB0byBmaXggdGhlIHVzZXIg
dmlzaWJsZSBwcm9ibGVtLgoKTm90ZSB0aGF0IHRoZSBsaWJkcm0gcGF0Y2hlcyBuZWVkIHRvIGxh
bmQgZmlyc3QsIGEgbGliZHJtIHJlbGVhc2UgbmVlZHMKdG8gYmUgbWFkZSwgYW5kIHRoZSBNZXNh
IHBhdGNoIG5lZWRzIHRvIGJ1bXAgdGhlIGxpYmRybV9hbWRncHUgdmVyc2lvbgpyZXF1aXJlbWVu
dCB0byB0aGF0IHJlbGVhc2UncyB2ZXJzaW9uIGJlZm9yZSBpdCBjYW4gbGFuZC4KCk1pY2hlbCBE
w6RuemVyICg5KToKICBhbWRncHU6IFBhc3MgZmlsZSBkZXNjcmlwdG9yIGRpcmVjdGx5IHRvIGFt
ZGdwdV9jbG9zZV9rbXNfaGFuZGxlCiAgYW1kZ3B1OiBBZGQgQk8gaGFuZGxlIHRvIHRhYmxlIGlu
IGFtZGdwdV9ib19jcmVhdGUKICBhbWRncHU6IFJlbmFtZSBmZF9tdXRleC9saXN0IHRvIGRldl9t
dXRleC9saXN0CiAgYW1kZ3B1OiBBZGQgc3RydWN0IGFtZGdwdV9jb3JlX2RldmljZSBhbmQgYW1k
Z3B1X2NvcmVfYm8KICBhbWRncHU6IEFkZCBhbWRncHVfYm9faGFuZGxlX3R5cGVfa21zX3VzZXIK
ICBhbWRncHU6IFJlLXVzZSBhbiBleGlzdGluZyBhbWRncHVfZGV2aWNlIHdoZW4gcG9zc2libGUK
ICBhbWRncHU6IFVzZSBub3JtYWwgaW50ZWdlcnMgZm9yIGRldmljZSAvIGNvcmUgQk8gcmVmZXJl
bmNlIGNvdW50aW5nCiAgYW1kZ3B1OiBEcm9wIHJlZmNvdW50IG1lbWJlciBmcm9tIHN0cnVjdCBh
bWRncHVfY29yZV9iby9kZXZpY2UKICB3aW5zeXMvYW1kZ3B1OiBVc2UgYW1kZ3B1X2JvX2hhbmRs
ZV90eXBlX2ttc191c2VyIGZvciBBUEkgS01TIGhhbmRsZXMKCiBhbWRncHUvYW1kZ3B1LmggICAg
ICAgICAgICAgICB8ICAxNCArLQogYW1kZ3B1L2FtZGdwdV9hc2ljX2lkLmMgICAgICAgfCAgIDQg
Ky0KIGFtZGdwdS9hbWRncHVfYm8uYyAgICAgICAgICAgIHwgMzY3ICsrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0KIGFtZGdwdS9hbWRncHVfY3MuYyAgICAgICAgICAgIHwgIDY0ICsr
Ky0tLQogYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyAgICAgICAgfCAyODEgKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0KIGFtZGdwdS9hbWRncHVfZ3B1X2luZm8uYyAgICAgIHwgIDM1ICsrLS0KIGFt
ZGdwdS9hbWRncHVfaW50ZXJuYWwuaCAgICAgIHwgIDMxICsrLQogYW1kZ3B1L2FtZGdwdV92YW1n
ci5jICAgICAgICAgfCAgIDkgKy0KIGFtZGdwdS9hbWRncHVfdm0uYyAgICAgICAgICAgIHwgICA0
ICstCiB0ZXN0cy9hbWRncHUvYW1kZ3B1X3Rlc3QuYyAgICB8ICAgMiArLQogdGVzdHMvYW1kZ3B1
L2JvX3Rlc3RzLmMgICAgICAgfCAgIDIgKy0KIHRlc3RzL2FtZGdwdS9jc190ZXN0cy5jICAgICAg
IHwgICA4ICstCiB0ZXN0cy9hbWRncHUvZGVhZGxvY2tfdGVzdHMuYyB8ICAgOCArLQogdGVzdHMv
YW1kZ3B1L3V2ZF9lbmNfdGVzdHMuYyAgfCAgIDIgKy0KIHRlc3RzL2FtZGdwdS92Y2VfdGVzdHMu
YyAgICAgIHwgIDEyICstCiB0ZXN0cy9hbWRncHUvdmNuX3Rlc3RzLmMgICAgICB8ICAgNCArLQog
dGVzdHMvYW1kZ3B1L3ZtX3Rlc3RzLmMgICAgICAgfCAgIDIgKy0KIDE3IGZpbGVzIGNoYW5nZWQs
IDUwMCBpbnNlcnRpb25zKCspLCAzNDkgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
