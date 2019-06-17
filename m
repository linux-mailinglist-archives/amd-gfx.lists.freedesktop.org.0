Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4376949023
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81B089F8B;
	Mon, 17 Jun 2019 19:47:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBA489F3C
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:08 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id w17so5894453qto.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bVqDFoFFnb4ARIN7C0iPJ7hEnIp4AcGRVizMiZs/SUE=;
 b=s4NHogpQctGeEn9dbl3NV9w5LeLpFYeTiD1enzid0voIiS2PPdkx1c2BJmPKhqDHj6
 PprknfvXv8M5wKFKHGIQBBlC7ydpknNahrC2P2NF0I3YHi9vqMW3Tz0rRtoqLXu5oa3o
 rbrmRmsLHrRUvhNI4X1MG/0wMBs5QUMV8wc+AlAbkQdLB4sBN8g7FpzxY2PgYVg+IA3n
 cWfBQT4Mwc9uK5fjyR3u9eA0A3bo3V378/ntGBD2rd4CkyUftjq0aUDEh7PFWGsNo4n7
 VMbk1DRhzWvUm7wlOEm68Z6K9npXhlrVgAPNJ4FFzQ7V9vNXxZXt9XXtbm2lbe5FDDGX
 aJCw==
X-Gm-Message-State: APjAAAUz44S3JYf2PupJkHcnjS5wE6bQs9lVWdOZ5+RpKIhfFg/UTX+W
 RrOqjSecgHTEo50N/bEnlD9WW6oyn0HS9w==
X-Google-Smtp-Source: APXvYqx9C9pdReV1MoX3pU4gWuGkmWXMGO3Xj1oAyYQAs3SJ1IIvbLBn41VfJjv3aCjEEjmDQQT+7w==
X-Received: by 2002:ac8:3014:: with SMTP id f20mr96354073qte.69.1560800826991; 
 Mon, 17 Jun 2019 12:47:06 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:06 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 370/459] drm/amd/display: Remove dependency on pipe->plane for
 immedaite flip status
Date: Mon, 17 Jun 2019 14:45:11 -0500
Message-Id: <20190617194540.18497-71-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bVqDFoFFnb4ARIN7C0iPJ7hEnIp4AcGRVizMiZs/SUE=;
 b=bTOxHEdUpXPkPGKunQm2noZcCIlUV65zSTXn/BFhUdrYs19yMWeBzoKK3LQbHx3QcC
 crSbrwsDXd2vNq3H0Q5n8RsCt13y60gxu6B/j3xh56cvc6dwYosg2HdMe7bG4y5Id9BP
 laxU/jp3rIJaagFWsspiVey7UK0SAD4XYVvp6yDfr7ftdh5kmjGZD0n8+F5ymtb0VXBH
 l0vpakJ8padQas04cM8E6h3CBJvDsmVeXfxAn1yfvT4DAIq+JkqQrQcICWQKhrgalkBJ
 TiE8miEQjiekkVX+9t0GNguQLPuDfXI/J68aG9x81dAfRUbEorARF2NohlvETXxQkvG4
 4saQ==
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
Cc: Leo Li <sunpeng.li@amd.com>, Joshua Aberback <joshua.aberback@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEuYWJlcmJhY2tAYW1kLmNvbT4KCltXaHldCmRj
bjIwX2FwcGx5X2N0eF9mb3Jfc3VyZmFjZSBjYW4gYmUgY2FsbGVkIHdpdGggMCBwbGFuZXMsIHdo
aWNoIG1lYW5zIHdlCnNob3VsZCBibGFuayB0aGUgZGlzcGxheS4gSW4gdGhpcyBjYXNlIHdoZW4g
d2UgZ2V0IGRvd24gdG8KZGNuMjBfc2V0dXBfZ3NsX2dyb3VwX2FzX2xvY2ssIHBpcGVfY3R4LT5w
bGFuZV9zdGF0ZSBpcyBOVUxMLCBidXQgd2UgZG9uJ3QKY2hlY2sgZm9yIGl0LiBIb3dldmVyLCB0
aGlzIGZ1bmN0aW9uIGlzIG9ubHkgY2FsbGVkIGJ5CmRjbjIwX3BpcGVfY29udHJvbF9sb2NrLCBh
bmQgaW4gdGhhdCBmdW5jdGlvbiB3ZSBhbHJhZWR5IGhhdmUgYSBsb2NhbCBmb3IKdGhlIGltbWVk
aWF0ZSBmbGlwIHN0YXR1cywgd2hpY2ggaXMgd2hhdCB3ZSBjYXJlIGFib3V0IGluIHRoZSBwbGFu
ZSBzdGF0ZS4KCltIb3ddCiAtIHBhc3MgaW4gaW1tZWRpYXRlIGZsaXAgc3RhdHVzIGFzIHBhcmFt
ZXRlcgoKU2lnbmVkLW9mZi1ieTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEuYWJlcmJhY2tAYW1k
LmNvbT4KUmV2aWV3ZWQtYnk6IEtydW5vc2xhdiBLb3ZhYyA8S3J1bm9zbGF2LktvdmFjQGFtZC5j
b20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIHwgOSArKysrKy0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5oIHwgMyArKy0K
IDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKaW5k
ZXggY2NiOWYyNzc5MTFhLi4wY2FkNTFlY2UwNmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCkBAIC0xMjU1LDcgKzEyNTUsNyBA
QCBzdGF0aWMgdm9pZCBkY24yMF9waXBlX2NvbnRyb2xfbG9jaygKIAlpZiAobG9jayAmJiBwaXBl
LT5ib3R0b21fcGlwZSAhPSBOVUxMKQogCQlpZiAoKGZsaXBfaW1tZWRpYXRlICYmIHBpcGUtPnN0
cmVhbV9yZXMuZ3NsX2dyb3VwID09IDApIHx8CiAJCSAgICAoIWZsaXBfaW1tZWRpYXRlICYmIHBp
cGUtPnN0cmVhbV9yZXMuZ3NsX2dyb3VwID4gMCkpCi0JCQlkY24yMF9zZXR1cF9nc2xfZ3JvdXBf
YXNfbG9jayhkYywgcGlwZSk7CisJCQlkY24yMF9zZXR1cF9nc2xfZ3JvdXBfYXNfbG9jayhkYywg
cGlwZSwgZmxpcF9pbW1lZGlhdGUpOwogCiAJaWYgKHBpcGUtPnBsYW5lX3N0YXRlICE9IE5VTEwg
JiYgcGlwZS0+cGxhbmVfc3RhdGUtPnRyaXBsZWJ1ZmZlcl9mbGlwcykgewogCQlpZiAobG9jaykK
QEAgLTE4OTAsMTQgKzE4OTAsMTUgQEAgc3RhdGljIGludCBmaW5kX2ZyZWVfZ3NsX2dyb3VwKGNv
bnN0IHN0cnVjdCBkYyAqZGMpCiAgKi8KIHZvaWQgZGNuMjBfc2V0dXBfZ3NsX2dyb3VwX2FzX2xv
Y2soCiAJCWNvbnN0IHN0cnVjdCBkYyAqZGMsCi0JCXN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgp
CisJCXN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgsCisJCWJvb2wgZmxpcF9pbW1lZGlhdGUpCiB7
CiAJc3RydWN0IGdzbF9wYXJhbXMgZ3NsOwogCWludCBncm91cF9pZHg7CiAKIAltZW1zZXQoJmdz
bCwgMCwgc2l6ZW9mKHN0cnVjdCBnc2xfcGFyYW1zKSk7CiAKLQlpZiAocGlwZV9jdHgtPnBsYW5l
X3N0YXRlLT5mbGlwX2ltbWVkaWF0ZSkgeworCWlmIChmbGlwX2ltbWVkaWF0ZSkgewogCQkvKiBy
ZXR1cm4gaWYgZ3JvdXAgYWxyZWFkeSBhc3NpZ25lZCBzaW5jZSBHU0wgd2FzIHNldCB1cAogCQkg
KiBmb3IgdnN5bmMgZmxpcCwgd2Ugd291bGQgdW5hc3NpZ24gc28gaXQgY2FuJ3QgYmUgImxlZnQg
b3ZlciIKIAkJICovCkBAIC0xOTY0LDcgKzE5NjUsNyBAQCB2b2lkIGRjbjIwX3NldHVwX2dzbF9n
cm91cF9hc19sb2NrKAogCiAJCXBpcGVfY3R4LT5zdHJlYW1fcmVzLnRnLT5mdW5jcy0+c2V0X2dz
bF9zb3VyY2Vfc2VsZWN0KAogCQkJcGlwZV9jdHgtPnN0cmVhbV9yZXMudGcsIGdyb3VwX2lkeCwK
LQkJCXBpcGVfY3R4LT5wbGFuZV9zdGF0ZS0+ZmxpcF9pbW1lZGlhdGUgPyA0IDogMCk7CisJCQlm
bGlwX2ltbWVkaWF0ZSA/IDQgOiAwKTsKIAl9IGVsc2UKIAkJQlJFQUtfVE9fREVCVUdHRVIoKTsK
IH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9od3NlcS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3
c2VxLmgKaW5kZXggYWJhNmY4N2M3ZjJiLi4zNzY5OWRmNjg1ZWUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5oCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5oCkBAIC04NSw2ICs4
NSw3IEBAIHZvaWQgZGNuMjBfcHJvZ3JhbV90cmlwbGVCdWZmZXIoCiB2b2lkIGRjbjIwX3NldHVw
X3Z1cGRhdGVfaW50ZXJydXB0KHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgpOwogCiB2b2lkIGRj
bjIwX3NldHVwX2dzbF9ncm91cF9hc19sb2NrKGNvbnN0IHN0cnVjdCBkYyAqZGMsCi0JCQkJICBz
dHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4KTsKKwkJCQkgIHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9j
dHgsCisJCQkJICBib29sIGZsaXBfaW1tZWRpYXRlKTsKIAogI2VuZGlmIC8qIF9fRENfSFdTU19E
Q04yMF9IX18gKi8KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
