Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D27DFE352
	for <lists+amd-gfx@lfdr.de>; Fri, 15 Nov 2019 17:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2326E99F;
	Fri, 15 Nov 2019 16:51:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20CC6E996
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 Nov 2019 16:51:05 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id q70so8598583qke.12
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 Nov 2019 08:51:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bFYsp63lkmiNIGxUbzfEOILdAxDIS+R8OA5WHO2VkgA=;
 b=RGB/OrFbrCkbW2WwwwSdPINF7dl/DmBPlfdtkw6BkwqIAuKFDupFBTEHU9SkysvNQ2
 Nwi07rIcDYIY349z2OO0unWeNR4Ud8CXRUoUnojk1mx4XH3V3Z5SPvdoJrNlpIhEIWIL
 qrqneylFB/XQiyg/U3e0n7L4KfltYjTDhfayiCfwE3t4ZehkTKhPM799nggUgZDpEKLj
 Gst1wB3dTxIZaDgZE7k+JBH+O32UAfO6nX51wrfDIi6jxuHe8FuKCJhrfVfzsob5zMPm
 Fxeb6n2YrKWGE0dOQ1ibzXFF33ZcL0eZpDVDaRgXkhBCXYX5uZRDtcltGkWTe3Xx0B6W
 HCyg==
X-Gm-Message-State: APjAAAXE1YyYR4dVUJY25ceQhsaqLP+mnpd6jesi1up9DntCMGJMxdLp
 DGYGHKQhhH13oECJCGxOPJ9jH9ge
X-Google-Smtp-Source: APXvYqwnrPfEIxtnj95E0z6sMAScGe7tYRylFJZ8nsTfXGfIgJMe8mqRFLAlVQCwKlydbI2btQJ46w==
X-Received: by 2002:a05:620a:20cd:: with SMTP id
 f13mr12770548qka.461.1573836664664; 
 Fri, 15 Nov 2019 08:51:04 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:51:04 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Subject: [PATCH 18/20] ALSA: hda/hdmi - Add new pci ids for AMD GPU display
 audio
Date: Fri, 15 Nov 2019 11:50:36 -0500
Message-Id: <20191115165038.56646-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bFYsp63lkmiNIGxUbzfEOILdAxDIS+R8OA5WHO2VkgA=;
 b=P+9zR12+B7+Ni+mQRP67o2Zs3sONiX4nIjJ7qmq8rJd/5bilLekrEvhkGEti7zOzae
 kkZidJRPfqthSVPYtG2fDC7CFyY+VWBRtWwPqaC3xGtAmJcreHZo+H0JNyBORPGUvs35
 JbSWbQ9m9VESKGc2o68e13RVPqf5CH9LdOawHSmsWJRygTEauNIEJA0mR6Wr/9AI9Hm/
 8P59NczdvXFHjufZZI0TwqjTOBXiFvqC8mHkrNVqP+kAoIBEqv6zeoLJAJooBBxElE7f
 JPnWwuua7w6S04n27GKQkevQoxzgi5bXGbFV6R+EiwH4onQBO8iCbp1WAZkLWqdLRY0q
 ZuxQ==
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

VGhlc2UgYXJlIG5lZWRlZCBzbyB3ZSBjYW4gZW5hYmxlIHJ1bnRpbWUgcG0gaW4gYSBzdWJzZXF1
ZW50CnBhdGNoLgoKUmV2aWV3ZWQtYnk6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4KU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0K
IHNvdW5kL3BjaS9oZGEvaGRhX2ludGVsLmMgfCAxNCArKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL2hkYV9p
bnRlbC5jIGIvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYwppbmRleCAzZWJjN2IyYTg5N2YuLjc5
Y2E5N2Q2YzgxMSAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYworKysgYi9z
b3VuZC9wY2kvaGRhL2hkYV9pbnRlbC5jCkBAIC0yNjA2LDYgKzI2MDYsMjAgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIGF6eF9pZHNbXSA9IHsKIAkgIC5kcml2ZXJfZGF0YSA9
IEFaWF9EUklWRVJfQVRJSERNSV9OUyB8IEFaWF9EQ0FQU19QUkVTRVRfQVRJX0hETUlfTlMgfSwK
IAl7IFBDSV9ERVZJQ0UoMHgxMDAyLCAweGFhZjApLAogCSAgLmRyaXZlcl9kYXRhID0gQVpYX0RS
SVZFUl9BVElIRE1JX05TIHwgQVpYX0RDQVBTX1BSRVNFVF9BVElfSERNSV9OUyB9LAorCXsgUENJ
X0RFVklDRSgweDEwMDIsIDB4YWFmOCksCisJICAuZHJpdmVyX2RhdGEgPSBBWlhfRFJJVkVSX0FU
SUhETUlfTlMgfCBBWlhfRENBUFNfUFJFU0VUX0FUSV9IRE1JX05TIH0sCisJeyBQQ0lfREVWSUNF
KDB4MTAwMiwgMHhhYjAwKSwKKwkgIC5kcml2ZXJfZGF0YSA9IEFaWF9EUklWRVJfQVRJSERNSV9O
UyB8IEFaWF9EQ0FQU19QUkVTRVRfQVRJX0hETUlfTlMgfSwKKwl7IFBDSV9ERVZJQ0UoMHgxMDAy
LCAweGFiMDgpLAorCSAgLmRyaXZlcl9kYXRhID0gQVpYX0RSSVZFUl9BVElIRE1JX05TIHwgQVpY
X0RDQVBTX1BSRVNFVF9BVElfSERNSV9OUyB9LAorCXsgUENJX0RFVklDRSgweDEwMDIsIDB4YWIx
MCksCisJICAuZHJpdmVyX2RhdGEgPSBBWlhfRFJJVkVSX0FUSUhETUlfTlMgfCBBWlhfRENBUFNf
UFJFU0VUX0FUSV9IRE1JX05TIH0sCisJeyBQQ0lfREVWSUNFKDB4MTAwMiwgMHhhYjE4KSwKKwkg
IC5kcml2ZXJfZGF0YSA9IEFaWF9EUklWRVJfQVRJSERNSV9OUyB8IEFaWF9EQ0FQU19QUkVTRVRf
QVRJX0hETUlfTlMgfSwKKwl7IFBDSV9ERVZJQ0UoMHgxMDAyLCAweGFiMjApLAorCSAgLmRyaXZl
cl9kYXRhID0gQVpYX0RSSVZFUl9BVElIRE1JX05TIHwgQVpYX0RDQVBTX1BSRVNFVF9BVElfSERN
SV9OUyB9LAorCXsgUENJX0RFVklDRSgweDEwMDIsIDB4YWIzOCksCisJICAuZHJpdmVyX2RhdGEg
PSBBWlhfRFJJVkVSX0FUSUhETUlfTlMgfCBBWlhfRENBUFNfUFJFU0VUX0FUSV9IRE1JX05TIH0s
CiAJLyogVklBIFZUODI1MS9WVDgyMzdBICovCiAJeyBQQ0lfREVWSUNFKDB4MTEwNiwgMHgzMjg4
KSwgLmRyaXZlcl9kYXRhID0gQVpYX0RSSVZFUl9WSUEgfSwKIAkvKiBWSUEgR0ZYIFZUNzEyMi9W
WDkwMCAqLwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
