Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 119B81084B1
	for <lists+amd-gfx@lfdr.de>; Sun, 24 Nov 2019 20:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFA989991;
	Sun, 24 Nov 2019 19:15:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Sun, 24 Nov 2019 19:15:17 UTC
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D00389991
 for <amd-gfx@lists.freedesktop.org>; Sun, 24 Nov 2019 19:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E59F6D7D15327
 for <amd-gfx@lists.freedesktop.org>; Sun, 24 Nov 2019 13:15:16 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2PUp5of0pKRB for <amd-gfx@lists.freedesktop.org>;
 Sun, 24 Nov 2019 13:15:16 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 65482D7D1520F
 for <amd-gfx@lists.freedesktop.org>; Sun, 24 Nov 2019 13:15:16 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 65482D7D1520F
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id YEJQG8wat-X4 for <amd-gfx@lists.freedesktop.org>;
 Sun, 24 Nov 2019 13:15:16 -0600 (CST)
Received: from vali.starlink.edu (unknown [192.168.3.2])
 by mail.rptsys.com (Postfix) with ESMTP id 41AE8D7D151BC
 for <amd-gfx@lists.freedesktop.org>; Sun, 24 Nov 2019 13:15:16 -0600 (CST)
Date: Sun, 24 Nov 2019 13:15:16 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: amd-gfx <amd-gfx@lists.freedesktop.org>
Message-ID: <2068915477.1923611.1574622916022.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 1/1] amdgpu: Enable KFD on POWER systems
MIME-Version: 1.0
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC73 (Linux)/8.5.0_GA_3042)
Thread-Index: B2j5+AMF9DRDIPJuMfhOLVlgdnyC9A==
Thread-Topic: amdgpu: Enable KFD on POWER systems
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1574622916; bh=2MQO179P7zE1+HOzEDNbR5xqkVvYgRTw03CLL7P5wog=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=BCkL8np+un9/Yx/AFQfaI95wrrhKUyc2S7DeHslfkk6sxi7uapqQMtPBw0wSLVxPm
 7DhqtwUdw3B6WjlQx1gmUnUAVo1s4e7q9t16GWJaFQxZvo4SsIxLvGQxufuqyliCev
 9Y+jBS2zMWo+3D5UTJdhVxoJqmrJKBRq7J7ycNdc=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

S0ZEIGhhcyBiZWVuIHZlcmlmaWVkIHRvIGZ1bmN0aW9uIG9uIFBPV0VSIHN5c3RlbXMgKFRhbG9z
IElJIC8gVmVnYSA2NCkuCkl0IHNob3VsZCBiZSBhdmFpbGFibGUgYXMgYSBrZXJuZWwgY29uZmln
dXJhdGlvbiBvcHRpb24gb24gdGhlc2Ugc3lzdGVtcy4KClNpZ25lZC1vZmYtYnk6IFRpbW90aHkg
UGVhcnNvbiA8dHBlYXJzb25AcmFwdG9yZW5naW5lZXJpbmcuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL0tjb25maWcgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQvS2NvbmZpZwppbmRleCBh
MWEzNWQ0ZDU5NGIuLmJhMGU2ODA1N2E4OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQvS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9LY29uZmln
CkBAIC01LDcgKzUsNyBAQAogCiBjb25maWcgSFNBX0FNRAogCWJvb2wgIkhTQSBrZXJuZWwgZHJp
dmVyIGZvciBBTUQgR1BVIGRldmljZXMiCi0JZGVwZW5kcyBvbiBEUk1fQU1ER1BVICYmIChYODZf
NjQgfHwgQVJNNjQpCisJZGVwZW5kcyBvbiBEUk1fQU1ER1BVICYmIChYODZfNjQgfHwgQVJNNjQg
fHwgUFBDNjQpCiAJaW1wbHkgQU1EX0lPTU1VX1YyIGlmIFg4Nl82NAogCXNlbGVjdCBNTVVfTk9U
SUZJRVIKIAloZWxwCi0tIAoyLjIwLjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
