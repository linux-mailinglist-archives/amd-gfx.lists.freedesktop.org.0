Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5442B1314
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 18:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C521E6EDCA;
	Thu, 12 Sep 2019 16:53:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 309 seconds by postgrey-1.36 at gabe;
 Thu, 12 Sep 2019 16:53:03 UTC
Received: from us-smtp-delivery-72.mimecast.com
 (us-smtp-delivery-72.mimecast.com [63.128.21.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AEA6EDCA
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 16:53:03 +0000 (UTC)
Received: from smtp01.valvesoftware.com (smtp01.valvesoftware.com
 [208.64.203.181]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-om8smTrqM0SBitwwWEkIJA-1; Thu, 12 Sep 2019 12:46:41 -0400
Received: from [172.16.1.107] (helo=antispam.valve.org)
 by smtp01.valvesoftware.com with esmtp (Exim 4.86_2)
 (envelope-from <pgriffais@valvesoftware.com>) id 1i8SEz-00038i-2R
 for amd-gfx@lists.freedesktop.org; Thu, 12 Sep 2019 09:46:41 -0700
Received: from antispam.valve.org (127.0.0.1) id hf9r720171si for
 <amd-gfx@lists.freedesktop.org>;
 Thu, 12 Sep 2019 09:46:41 -0700 (envelope-from <pgriffais@valvesoftware.com>)
Received: from mail1.valvemail.org ([172.16.144.22])
 by antispam.valve.org ([172.16.1.107]) (SonicWALL 9.0.5.2081 )
 with ESMTP id o201909121646400066508-5; Thu, 12 Sep 2019 09:46:40 -0700
Received: from pgriffais.valve.org (172.18.21.27) by mail1.valvemail.org
 (172.16.144.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1415.2; Thu, 12 Sep
 2019 09:46:04 -0700
From: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Create plane rotation property
Date: Thu, 12 Sep 2019 09:44:04 -0700
Message-ID: <20190912164404.12725-1-pgriffais@valvesoftware.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-ClientProxiedBy: mail1.valvemail.org (172.16.144.22) To mail1.valvemail.org
 (172.16.144.22)
X-EXCLAIMER-MD-CONFIG: fe5cb8ea-1338-4c54-81e0-ad323678e037
X-Mlf-CnxnMgmt-Allow: 172.16.144.22
X-Mlf-Version: 9.0.5.2081
X-Mlf-License: BSVKCAP__
X-Mlf-UniqueId: o201909121646400066508
X-MC-Unique: om8smTrqM0SBitwwWEkIJA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=valvesoftware.com; 
 s=mc20150811; t=1568307182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wbvovLxIjlDAOr6xHF4hy4PqvwXQZom4aK8SLjMXQKE=;
 b=Ho0Jb/gf84I/UolZ5EJOFOqyI/+0WvrP1yueskCQyw7pEIzFAs7Ylg0fNoUmgxomTtWPLc
 Jva+jBgl5uo6dt5na1RneZVD2xrRqArW1SBNfezM2GRJocVRL8gDG+4+KDEi5NboOrzx9S
 0qQvoB+I9EsY3bM4nWtcXlFa9AmT6F0=
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
Cc: Alexander.Deucher@amd.com, hwentlan@amd.com,
 "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXQncyBvdGhlcndpc2UgcHJvcGVybHkgc3VwcG9ydGVkLCBqdXN0IG5lZWRzIGV4cG9zaW5nIHRv
IHVzZXJzcGFjZS4KClNpZ25lZC1vZmYtYnk6IFBpZXJyZS1Mb3VwIEEuIEdyaWZmYWlzIDxwZ3Jp
ZmZhaXNAdmFsdmVzb2Z0d2FyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYwppbmRleCA0NWJlN2EyMTMyYmIuLjM3NzI3NjNjNjQ0OSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC00
NjgwLDYgKzQ2ODAsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9wbGFuZV9pbml0KHN0cnVjdCBh
bWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSwKIAl1aW50MzJfdCBmb3JtYXRzWzMyXTsKIAlpbnQg
bnVtX2Zvcm1hdHM7CiAJaW50IHJlcyA9IC1FUEVSTTsKKwl1bnNpZ25lZCBpbnQgc3VwcG9ydGVk
X3JvdGF0aW9uczsKIAogCW51bV9mb3JtYXRzID0gZ2V0X3BsYW5lX2Zvcm1hdHMocGxhbmUsIHBs
YW5lX2NhcCwgZm9ybWF0cywKIAkJCQkJQVJSQVlfU0laRShmb3JtYXRzKSk7CkBAIC00NzExLDYg
KzQ3MTIsMTMgQEAgc3RhdGljIGludCBhbWRncHVfZG1fcGxhbmVfaW5pdChzdHJ1Y3QgYW1kZ3B1
X2Rpc3BsYXlfbWFuYWdlciAqZG0sCiAJCQlEUk1fQ09MT1JfWUNCQ1JfQlQ3MDksIERSTV9DT0xP
Ul9ZQ0JDUl9MSU1JVEVEX1JBTkdFKTsKIAl9CiAKKwlzdXBwb3J0ZWRfcm90YXRpb25zID0KKwkJ
RFJNX01PREVfUk9UQVRFXzAgfCBEUk1fTU9ERV9ST1RBVEVfOTAgfAorCQlEUk1fTU9ERV9ST1RB
VEVfMTgwIHwgRFJNX01PREVfUk9UQVRFXzI3MDsKKworCWRybV9wbGFuZV9jcmVhdGVfcm90YXRp
b25fcHJvcGVydHkocGxhbmUsIERSTV9NT0RFX1JPVEFURV8wLAorCQkJCQkgICBzdXBwb3J0ZWRf
cm90YXRpb25zKTsKKwogCWRybV9wbGFuZV9oZWxwZXJfYWRkKHBsYW5lLCAmZG1fcGxhbmVfaGVs
cGVyX2Z1bmNzKTsKIAogCS8qIENyZWF0ZSAocmVzZXQpIHRoZSBwbGFuZSBzdGF0ZSAqLwotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
