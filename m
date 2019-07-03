Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76195E787
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Jul 2019 17:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77966E15F;
	Wed,  3 Jul 2019 15:13:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2456E15B
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jul 2019 15:13:50 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h21so1574494qtn.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 03 Jul 2019 08:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dzPDq4U/kzMyMb/a/96VAoXGd+cI7Hj8br7rGCOpN/E=;
 b=CNxP2P8wSXljI6bhPSy+y2PnQmRDVk3D+nxXuUFNhXjO1eQu/IJVtbaR15uKgVu+EF
 r6Oi5ELUhCMkojTXPsyNmgVjUop6NV+Gvj9geaaC1j5bSA+Y4KtK97S7F/y1Ty5bS8jN
 zPwP5tuvDnJFRhfmp9hvGaq/2QTITWlFIo7qjxJvyKHv2PZyrUcRbpzsdLhU2WfCqNHc
 3hdDTlXXDELVE7T2YP03faVLMMSCEp5xsfBFGEmH+zAUG8uhJGOpaATDlEzEpzgDLTj+
 xl/s823szpTwxIxSy2MJ2MmZiItEqdrbP+eNXxWbxr3HTvo06/XjOxJKWOEgzbDR/ZWe
 L7cg==
X-Gm-Message-State: APjAAAXZU/sbhcGgAaZ8vi2C7ISsUiS7/5yF4R5rAJ5jeUjqhlvD8mnA
 R/Rigl1jsMvlvf8HwJIY7yccbByJQ4qSFw==
X-Google-Smtp-Source: APXvYqzoHBqHSf2HnOOTC9Fj9FcaAf7CsO3G1dYKYY0JK9anjaWZCOe2hEhHHNJbfZgt2HGDBkvV9A==
X-Received: by 2002:a0c:8a43:: with SMTP id 3mr33467690qvu.138.1562166828908; 
 Wed, 03 Jul 2019 08:13:48 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id q9sm961617qtn.86.2019.07.03.08.13.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 08:13:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: add missing documentation on new module
 parameters
Date: Wed,  3 Jul 2019 10:13:40 -0500
Message-Id: <20190703151341.5916-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dzPDq4U/kzMyMb/a/96VAoXGd+cI7Hj8br7rGCOpN/E=;
 b=JZK3mxuZS4iAbKGec46g+CGNtz+HESRpkg5qH9St9/poJ/q8kODrEARo5RDr1iElkh
 BtYOJDZcnQh//7L9AVr47M9bhMMep0JL2g9mvsjwDNHq3jO5w+U/sAOvVrH0VICwABBh
 9ilILeuNG7gqFgOj07Wstlde6zwvuQIcU/Xqs5WXNkEUkNwvtvoL8luy+NPYUQz/svYG
 zt0QUP/X3clA2lCrafV0dYVeAmILMHTRX7/EHShlVTrQZK5gF5nuEXNjcu3/5ZiJb12H
 czfZbCgOZFP5wfXNs4eD7pl9ry5yms5EMRJtq0xDC12UP30oL6q2W2KKSwfsc9hU+t1/
 zvLQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TmV3IHBhcmFtZXRlcnMgYWRkZWQgZm9yIG5hdmkgbGFjayBkb2N1bWVudGF0aW9uLgoKU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDEzICsrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jCmluZGV4IDM5MTNhNzU5MjRjNi4uNzk0MWE1MzY4ZmI1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCkBAIC01ODEsMTQgKzU4MSwyNyBAQCBN
T0RVTEVfUEFSTV9ERVNDKGFzeW5jX2dmeF9yaW5nLAogCSJBc3luY2hyb25vdXMgR0ZYIHJpbmdz
IHRoYXQgY291bGQgYmUgY29uZmlndXJlZCB3aXRoIGVpdGhlciBkaWZmZXJlbnQgcHJpb3JpdGll
cyAoSFAzRCByaW5nIGFuZCBMUDNEIHJpbmcpLCBvciBlcXVhbCBwcmlvcml0aWVzICgwID0gZGlz
YWJsZWQsIDEgPSBlbmFibGVkIChkZWZhdWx0KSkiKTsKIG1vZHVsZV9wYXJhbV9uYW1lZChhc3lu
Y19nZnhfcmluZywgYW1kZ3B1X2FzeW5jX2dmeF9yaW5nLCBpbnQsIDA0NDQpOwogCisvKioKKyAq
IERPQzogbWNicCAoaW50KQorICogSXQgaXMgdXNlZCB0byBlbmFibGUgbWlkIGNvbW1hbmQgYnVm
ZmVyIHByZWVtcHRpb24uICgwID0gZGlzYWJsZWQgKGRlZmF1bHQpLCAxID0gZW5hYmxlZCkKKyAq
LwogTU9EVUxFX1BBUk1fREVTQyhtY2JwLAogCSJFbmFibGUgTWlkLWNvbW1hbmQgYnVmZmVyIHBy
ZWVtcHRpb24gKDAgPSBkaXNhYmxlZCAoZGVmYXVsdCksIDEgPSBlbmFibGVkKSIpOwogbW9kdWxl
X3BhcmFtX25hbWVkKG1jYnAsIGFtZGdwdV9tY2JwLCBpbnQsIDA0NDQpOwogCisvKioKKyAqIERP
QzogZGlzY292ZXJ5IChpbnQpCisgKiBBbGxvdyBkcml2ZXIgdG8gZGlzY292ZXIgaGFyZHdhcmUg
SVAgaW5mb3JtYXRpb24gZnJvbSBJUCBEaXNjb3ZlcnkgdGFibGUgYXQgdGhlIHRvcCBvZiBWUkFN
LgorICovCiBNT0RVTEVfUEFSTV9ERVNDKGRpc2NvdmVyeSwKIAkiQWxsb3cgZHJpdmVyIHRvIGRp
c2NvdmVyIGhhcmR3YXJlIElQcyBmcm9tIElQIERpc2NvdmVyeSB0YWJsZSBhdCB0aGUgdG9wIG9m
IFZSQU0iKTsKIG1vZHVsZV9wYXJhbV9uYW1lZChkaXNjb3ZlcnksIGFtZGdwdV9kaXNjb3Zlcnks
IGludCwgMDQ0NCk7CiAKKy8qKgorICogRE9DOiBtZXMgKGludCkKKyAqIEVuYWJsZSBNaWNybyBF
bmdpbmUgU2NoZWR1bGVyLiBUaGlzIGlzIGEgbmV3IGh3IHNjaGVkdWxpbmcgZW5naW5lIGZvciBn
ZngsIHNkbWEsIGFuZCBjb21wdXRlLgorICogKDAgPSBkaXNhYmxlZCAoZGVmYXVsdCksIDEgPSBl
bmFibGVkKQorICovCiBNT0RVTEVfUEFSTV9ERVNDKG1lcywKIAkiRW5hYmxlIE1pY3JvIEVuZ2lu
ZSBTY2hlZHVsZXIgKDAgPSBkaXNhYmxlZCAoZGVmYXVsdCksIDEgPSBlbmFibGVkKSIpOwogbW9k
dWxlX3BhcmFtX25hbWVkKG1lcywgYW1kZ3B1X21lcywgaW50LCAwNDQ0KTsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
