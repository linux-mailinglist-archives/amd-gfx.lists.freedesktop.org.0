Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1855F81E11
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 15:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5796E455;
	Mon,  5 Aug 2019 13:52:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 435 seconds by postgrey-1.36 at gabe;
 Mon, 05 Aug 2019 13:00:56 UTC
Received: from qq.com (smtpbg419.qq.com [183.3.226.243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449D189DA5
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 13:00:56 +0000 (UTC)
X-QQ-FEAT: wGRdIOemcLeTHdcYcbaVMhaHm5yIJnOFTG7M0Zhm64eZfdndfvS9szNep7lol
 vnWM8T2CIry9emJNkn0knnFDV8N1/vtdXfD0frLvJealxJ9fxfmx38wBdMrIlxCUl5uj4eS
 eAYISW96GedkCAvY77T4yZ15liv0FW/R8S4MDQjZWNWVe3EO9h3y7Z8/aarqL61cXk2Why9
 mb9sJ8TG2BwuV8TpxfBPHILkQpNv5V6REnXHybdnPjIk/jvvZdVW3T/sBBhk9IORN96VKC2
 Sp5CSM2/DaCEaHIGee+EyWsQhptcxrpS7new==
X-QQ-SSF: 00000000000000F000000000000000O
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 124.90.74.43
X-QQ-STYLE: 
X-QQ-mid: webmail473t1565009597t4755964
From: "=?gb18030?B?y+/Ez9PC?=" <497141801@qq.com>
To: "=?gb18030?B?YW1kLWdmeA==?=" <amd-gfx@lists.freedesktop.org>
Subject: [drm:amdgpu_ctx_mgr_entity_fini [amdgpu]] *ERROR* ctx
 00000000189dec14 is still alive
Mime-Version: 1.0
Date: Mon, 5 Aug 2019 20:53:17 +0800
X-Priority: 3
Message-ID: <tencent_03E0C311B11B64CA539D74F7174F5059E008@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 1120240469
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Mon, 05 Aug 2019 20:53:17 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign2
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Mon, 05 Aug 2019 13:52:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1565009598; bh=1U0fAlFufDuHEU92a8LzozhFuq/Yu3IVt0tr4rNMDB4=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=eIUlQOstc4ziBOg0JKW2ax5p/vcZ98/cLTVFXW74yAvTkPpBdW6Lxw7SqMhvZxCe4
 /1bJx23Jm4Qr7f3EA62G/DYYx3xF4l09qapIpLP2SFFYxp3Gp9irtaqquRdujFS7lP
 h8d10YPvjXXp2XTvSjRSJ2w0/a5O9oqQLTMy5vfE=
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
Content-Type: multipart/mixed; boundary="===============0900106955=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.

--===============0900106955==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5D4826BD_0B9B2D70_0CB8E48B"
Content-Transfer-Encoding: 8Bit

This is a multi-part message in MIME format.

------=_NextPart_5D4826BD_0B9B2D70_0CB8E48B
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KICAgIFNvbWV0aW1lIGRtZXNnIHNob3cgdGhpcyBsb2c6DQpbMTA0MDcuNzIw
OTg4XSBbZHJtOmFtZGdwdV9jdHhfbWdyX2VudGl0eV9maW5pIFthbWRncHVdXSAqRVJST1Iq
IGN0eCAwMDAwMDAwMDE4OWRlYzE0IGlzIHN0aWxsIGFsaXZlDQpbMTA0MDcuNzIxMDU0XSBb
ZHJtOmFtZGdwdV9jdHhfbWdyX2VudGl0eV9maW5pIFthbWRncHVdXSAqRVJST1IqIGN0eCAw
MDAwMDAwMDE4OWRlYzE0IGlzIHN0aWxsIGFsaXZlDQpbMTA0MDcuNzIxMTIwXSBbZHJtOmFt
ZGdwdV9jdHhfbWdyX2VudGl0eV9maW5pIFthbWRncHVdXSAqRVJST1IqIGN0eCAwMDAwMDAw
MDE4OWRlYzE0IGlzIHN0aWxsIGFsaXZlDQpbMTA0MDcuNzIxMTg3XSBbZHJtOmFtZGdwdV9j
dHhfbWdyX2VudGl0eV9maW5pIFthbWRncHVdXSAqRVJST1IqIGN0eCAwMDAwMDAwMDE4OWRl
YzE0IGlzIHN0aWxsIGFsaXZlDQpbMTA0MDcuNzIxNDE4XSBbZHJtOmFtZGdwdV9jdHhfbWdy
X2ZpbmkgW2FtZGdwdV1dICpFUlJPUiogY3R4IDAwMDAwMDAwMTg5ZGVjMTQgaXMgc3RpbGwg
YWxpdmUNCg0KDQoNCldoYXQgYXJlIHRoZSBzaWRlIGVmZmVjdHM/DQpEb2VzIHRoaXMgZXJy
b3Igd2lsbCBvY2N1ciBHUFUgaHVuZyhzdWNoIGFzIGdmeCB0aW1lb3V0KT8NCkhvdyB0byBm
aXggdGhpcz8NCg0KDQpNeSBrZXJuZWwgOiA0LjE5LjM2DQpNZXNhOiAxOC4zLjYNCg0KDQpB
bmQgSSBmaW5kIHRoYXQgaW4gYW1kZ3B1X2N0eC5jLCB0aGUgZnVuY3Rpb246YW1kZ3B1X2N0
eF9tZ3JfZW50aXR5X2ZsdXNoIGRvZXNuJ3QgY2hlY2sgdGhlIA0KY3R4LT5yZWZjb3VudCh0
aGUgY2hlY2sgaXMgc3RvcHBlZCBpbiB0aGlzIHBhdGNoOiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8/
aWQ9NDhhZDM2OGE4YTNhYjJmZDNjMmJjMmNjY2NjNmUyOWIxYWNkYTFiYikgLCANCiB3aHkg
YW1kZ3B1X2N0eF9tZ3JfZW50aXR5X2Zpbmkgc3RpbGwgbmVlZCBjaGVjayBjdHgtPnJlZmNv
dW50Pw0KQ2FuIGkgc3RvcCBjaGVjayBjdHgtPnJlZmNvdW50IGluICBhbWRncHVfY3R4X21n
cl9lbnRpdHlfZmluaSA/DQoNCg0KVGhhbmtzIQ==

------=_NextPart_5D4826BD_0B9B2D70_0CB8E48B
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PGRpdj5IaSBBbGwsPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7IFNvbWV0aW1lIGRtZXNnIHNo
b3cgdGhpcyBsb2c6PC9kaXY+PGRpdj48ZGl2PlsxMDQwNy43MjA5ODhdIFtkcm06YW1kZ3B1
X2N0eF9tZ3JfZW50aXR5X2ZpbmkgW2FtZGdwdV1dICpFUlJPUiogY3R4IDAwMDAwMDAwMTg5
ZGVjMTQgaXMgc3RpbGwgYWxpdmU8L2Rpdj48ZGl2PlsxMDQwNy43MjEwNTRdIFtkcm06YW1k
Z3B1X2N0eF9tZ3JfZW50aXR5X2ZpbmkgW2FtZGdwdV1dICpFUlJPUiogY3R4IDAwMDAwMDAw
MTg5ZGVjMTQgaXMgc3RpbGwgYWxpdmU8L2Rpdj48ZGl2PlsxMDQwNy43MjExMjBdIFtkcm06
YW1kZ3B1X2N0eF9tZ3JfZW50aXR5X2ZpbmkgW2FtZGdwdV1dICpFUlJPUiogY3R4IDAwMDAw
MDAwMTg5ZGVjMTQgaXMgc3RpbGwgYWxpdmU8L2Rpdj48ZGl2PlsxMDQwNy43MjExODddIFtk
cm06YW1kZ3B1X2N0eF9tZ3JfZW50aXR5X2ZpbmkgW2FtZGdwdV1dICpFUlJPUiogY3R4IDAw
MDAwMDAwMTg5ZGVjMTQgaXMgc3RpbGwgYWxpdmU8L2Rpdj48ZGl2PlsxMDQwNy43MjE0MThd
IFtkcm06YW1kZ3B1X2N0eF9tZ3JfZmluaSBbYW1kZ3B1XV0gKkVSUk9SKiBjdHggMDAwMDAw
MDAxODlkZWMxNCBpcyBzdGlsbCBhbGl2ZTwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+V2hhdCBhcmUgdGhlIHNpZGUgZWZmZWN0cz88L2Rpdj48ZGl2PkRvZXMgdGhpcyBlcnJv
ciB3aWxsIG9jY3VyIEdQVSBodW5nKHN1Y2ggYXMgZ2Z4IHRpbWVvdXQpPzwvZGl2PjxkaXY+
SG93IHRvIGZpeCB0aGlzPzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGRpdj5NeSBrZXJu
ZWwgOiA0LjE5LjM2PC9kaXY+PGRpdj5NZXNhOiAxOC4zLjY8L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2PkFuZCBJIGZpbmQgdGhhdCBpbiBhbWRncHVfY3R4LmMsIHRoZSBmdW5jdGlvbjph
bWRncHVfY3R4X21ncl9lbnRpdHlfZmx1c2ggZG9lc24ndCBjaGVjayB0aGUmbmJzcDs8L2Rp
dj48ZGl2PmN0eC0mZ3Q7cmVmY291bnQodGhlIGNoZWNrIGlzIHN0b3BwZWQgaW4gdGhpcyBw
YXRjaDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
c3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2lkPTQ4YWQzNjhhOGEzYWIyZmQzYzJiYzJjY2Nj
YzZlMjliMWFjZGExYmIpICwmbmJzcDs8L2Rpdj48ZGl2PiZuYnNwO3doeSZuYnNwO2FtZGdw
dV9jdHhfbWdyX2VudGl0eV9maW5pIHN0aWxsIG5lZWQgY2hlY2smbmJzcDtjdHgtJmd0O3Jl
ZmNvdW50PzwvZGl2PjxkaXY+Q2FuIGkgc3RvcCBjaGVjayZuYnNwO2N0eC0mZ3Q7cmVmY291
bnQgaW4mbmJzcDsgYW1kZ3B1X2N0eF9tZ3JfZW50aXR5X2ZpbmkgPzwvZGl2PjxkaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5UaGFua3MhPC9kaXY+PGRpdj48L2Rpdj48L2Rpdj48L2Rpdj4=

------=_NextPart_5D4826BD_0B9B2D70_0CB8E48B--




--===============0900106955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0900106955==--



