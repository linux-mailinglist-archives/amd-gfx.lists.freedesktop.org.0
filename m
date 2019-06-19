Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28624C843
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 09:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276126E4F1;
	Thu, 20 Jun 2019 07:22:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 19 Jun 2019 09:36:30 UTC
Received: from qq.com (smtpbg477.qq.com [59.36.132.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138106E31C
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 09:36:29 +0000 (UTC)
X-QQ-FEAT: 0ESs8nxzjD+ZpwjCocOCw4ww0RFJU/l9b/jsw2it+XaAh8/BUz9BSD//lGv5z
 xz/adZDEJ6RncurQDExsWClrdW//1LXpBvVu+C69ShQlIPh/NUT/15e5JkmEoCQ9l39KqPt
 PEl7zEOTjl0qHI+c4LmtXtcT4DJfu9RxhymsyaBEwuHpfX460aP13g4XkPsWHv3AbuS/n+s
 hbdC7TJNDukVbjUlld0NwQYfuYVGxpa/rjqLmP5ZQszJi/m4e6BVp+Filr5Jxqux7PI3rw3
 wQmfCSdeFtkIKH
X-QQ-SSF: 000000000000000000000000000000Z
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 124.90.74.43
X-QQ-STYLE: 
X-QQ-mid: webmail450t1560936539t2014353
From: "=?gb18030?B?Q0NYSUFPUA==?=" <664296544@qq.com>
To: "=?gb18030?B?YW1kLWdmeA==?=" <amd-gfx@lists.freedesktop.org>
Subject: amdgpu vce crash
Mime-Version: 1.0
Date: Wed, 19 Jun 2019 17:28:59 +0800
X-Priority: 3
Message-ID: <tencent_969412320833AB29CB6FA2732FC516257905@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Wed, 19 Jun 2019 17:29:00 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:22:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1560936542; bh=V37r8LOy5U9E24wW7srVFM0dc9PlBedPvrvOzzGAiQU=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=Gf3I0HGsrS9dGbyS+wJbZBM7oefFygzJBbxFxKdRiYrsP5/v4Sr84JKPv6Suyuu4h
 vpH/XgUttHIKUFl3rZgnIV9s5Stpiui/uQTCg4wmbXr4kunRxe/B5hJpihdAiTRG0F
 ooBaTtVNzwgPXAv1E1siMXSZNAcq20jkAl6Mr4T0=
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
Content-Type: multipart/mixed; boundary="===============1059598795=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.

--===============1059598795==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5D0A005B_09BF2530_2E2F270E"
Content-Transfer-Encoding: 8Bit

This is a multi-part message in MIME format.

------=_NextPart_5D0A005B_09BF2530_2E2F270E
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

V2UgYXJlIHVzaW5nIHd4NTEwMCBmb3IgcmVuZGVyaW5nIGFuZCBlbmNvZGluZyBvcGVyYXRp
b25zLCBidXQgc29tZXRpbWVzIHdlIGVuY291bnRlciB2Y2UgdGltZW91dCBhbmQgY3Jhc2gu
DQpJcyB2Y2Ugbm90IGEgaW5kZXBlbmRlbnQgbW9kdWxlIGluIGdwdT9XaHkgZG9lcyBpdCBh
ZmZlY3QgdGhlIHJlbmRlcmluZyBtb2R1bGU/DQoNCldlIGhvcGUgdGhhdCB2Y2Ugd2lsbCBu
b3QgYWZmZWN0IHRoZSByZW5kZXJpbmcgbW9kdWxlIHdoZW4gY3Jhc2hpbmcuDQpDYW4gSSBw
cmV2ZW50IHRoZSB1c2Ugb2YgdGhlIHJlbmRlcmluZyBtb2R1bGUgZnJvbSBiZWluZyBhZmZl
Y3RlZD8NCg0KDQpsaW51eCBrZXJuZWwgOjQuMTkuMzQNCm1lc2E6IDE4LjMuNQ0KbGx2bTog
Ny4wDQpmaXJtd2FyZToxOC41MA0KDQoNCg0KDQpBcyBsb2dzo7oNCg0KMjAxOS0wNi0xNVQx
NTozMzozMi4xMzM4NDIrMDg6MDB8ZXJyfGtlcm5lbFstXXxbMzE1MjQ4LjE3MjYwM10gW2Ry
bTphbWRncHVfam9iX3RpbWVkb3V0IFthbWRncHVdXSAqRVJST1IqIHJpbmcgdmNlMCB0aW1l
b3V0LCBzaWduYWxlZCBzZXE9MTE3MzczMCwgZW1pdHRlZCBzZXE9MTE3MzczMg0KMjAxOS0w
Ni0xNVQxNTozMzozMi4xMzM5MzkrMDg6MDB8aW5mb3xrZXJuZWxbLV18WzMxNTI0OC4xNzI2
MDddIFtkcm1dIEdQVSByZWNvdmVyeSBkaXNhYmxlZC4=

------=_NextPart_5D0A005B_09BF2530_2E2F270E
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PGRpdj5XZSBhcmUgdXNpbmcgd3g1MTAwIGZvciByZW5kZXJpbmcgYW5kIGVuY29kaW5nIG9w
ZXJhdGlvbnMsIGJ1dCBzb21ldGltZXMgd2UgZW5jb3VudGVyIHZjZSB0aW1lb3V0IGFuZCBj
cmFzaC48L2Rpdj48ZGl2PklzIHZjZSBub3QgYSBpbmRlcGVuZGVudCBtb2R1bGUgaW4gZ3B1
P1doeSBkb2VzIGl0IGFmZmVjdCB0aGUgcmVuZGVyaW5nIG1vZHVsZT88YnI+PC9kaXY+V2Ug
aG9wZSB0aGF0IHZjZSB3aWxsIG5vdCBhZmZlY3QgdGhlIHJlbmRlcmluZyBtb2R1bGUgd2hl
biBjcmFzaGluZy48YnI+PGRpdj5DYW4gSSBwcmV2ZW50IHRoZSB1c2Ugb2YgdGhlIHJlbmRl
cmluZyBtb2R1bGUgZnJvbSBiZWluZyBhZmZlY3RlZD88L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PmxpbnV4IGtlcm5lbCA6NC4xOS4zNDwvZGl2PjxkaXY+bWVzYTogMTguMy41PC9kaXY+
PGRpdj5sbHZtOiA3LjA8L2Rpdj48ZGl2PmZpcm13YXJlOjE4LjUwPGJyPjwvZGl2PjxkaXY+
PGJyPjwvZGl2Pjxicj5BcyBsb2dzo7o8YnI+PGJyPjIwMTktMDYtMTVUMTU6MzM6MzIuMTMz
ODQyKzA4OjAwfGVycnxrZXJuZWxbLV18WzMxNTI0OC4xNzI2MDNdIFtkcm06YW1kZ3B1X2pv
Yl90aW1lZG91dCBbYW1kZ3B1XV0gKkVSUk9SKiByaW5nIHZjZTAgdGltZW91dCwgc2lnbmFs
ZWQgc2VxPTExNzM3MzAsIGVtaXR0ZWQgc2VxPTExNzM3MzI8YnI+MjAxOS0wNi0xNVQxNToz
MzozMi4xMzM5MzkrMDg6MDB8aW5mb3xrZXJuZWxbLV18WzMxNTI0OC4xNzI2MDddIFtkcm1d
IEdQVSByZWNvdmVyeSBkaXNhYmxlZC48YnI+PGJyPg==

------=_NextPart_5D0A005B_09BF2530_2E2F270E--




--===============1059598795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1059598795==--



