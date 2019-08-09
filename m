Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 160FC87E92
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B344C6EE3B;
	Fri,  9 Aug 2019 15:53:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6410C6EE39
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:15 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id m2so7708183qkd.10
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tCIoQkYF77jNwyl4RZMS1lPbB7KYVseFVK4YbCQ1uYI=;
 b=TEmQG303hxY8hMyerBpeuG8PkTlsfMDu6MqpQtpvi2cCAECyGKLdN+GEGLu80JFKQY
 a+jO6dg8fTS7y/WyKwV7+V+V6Eyox7yTsE8dRHpdQVv0Q+dXPoR5ukt/s1XGXCRZ60AI
 GiVyfvfTFY9TUDGI1xTIR5hXrwF7XE1zAD5QX947hbWKI3IkKi/chFw6N5YboKTWp/hy
 FUBch8u4FXz+JQfsMHpo9Cw6nXvQKclAYP935gDnRqEoCSsEo8NhpXMAHsvvAulVZyNB
 llejkSqhv8Oo5vKxVWD4bYdQ+GupHGEBsHyk7PwkiUXLuXOY6srw4RkE2aPf2Hp/oi+Q
 vzyQ==
X-Gm-Message-State: APjAAAULDT17oCkVqr4MvVP5JJwvhiJW1goDIJi7aKdfdcdGE3PwrO1x
 AOumBJJPz2UqgopsJyM1pU0z4k+4
X-Google-Smtp-Source: APXvYqyReJE/m9w3tV1RKkbrnZDKCgy9N8L1YHf5+4+ak4WWYw/6AZHy76DxsRkIfqUTRxWhsNFPRQ==
X-Received: by 2002:a37:749:: with SMTP id 70mr18602699qkh.399.1565365994157; 
 Fri, 09 Aug 2019 08:53:14 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:13 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 05/27] drm/amdgpu: add gmc v9 supports for renoir
Date: Fri,  9 Aug 2019 10:52:40 -0500
Message-Id: <20190809155302.4733-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tCIoQkYF77jNwyl4RZMS1lPbB7KYVseFVK4YbCQ1uYI=;
 b=IYmVh/FiaN+fd8xJxaeo/xY5OcQo9aopyNmJguGH53xNW7y3KhNX9bixRBh4pG6tVI
 LCixAXQMeQaDqk9R7V+ERSoivHJLealUR94SR2lJ3kpwVQ7DWuTFPC6SWGZQte6NprSi
 z7jt9HNLt6JVSAA0ILljt3d2useAWkU+Qw45jV6leKU6PGMbZ2cZLKM6XkVw0sokmCPH
 dov6CdS3DHotWhVA0KzGNCYpvSUOSZQP88UP6zc9ZH2n00TeGDm91J+A88BhPfZgCFYf
 BO3gVM8Sl09nTwjtN61CJd+YPnoOEXL2MRYgtcen/cb3xac+lcylpNFHVdyS3hJ0i/uh
 shAg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KCkFkZCBnZnggbWVtb3J5IGNvbnRy
b2xsZXIgc3VwcG9ydCBmb3IgcmVub2lyLgoKU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXku
aHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdA
YW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCA3ICsr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYwppbmRleCBhMmFhMzVlYjUxMmMuLjkyMGJkNzdmNGM1MyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCkBAIC02ODYsNiArNjg2LDcgQEAgc3RhdGlj
IGJvb2wgZ21jX3Y5XzBfa2VlcF9zdG9sZW5fbWVtb3J5KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQogCWNhc2UgQ0hJUF9WRUdBMTA6CiAJY2FzZSBDSElQX1JBVkVOOgogCWNhc2UgQ0hJUF9B
UkNUVVJVUzoKKwljYXNlIENISVBfUkVOT0lSOgogCQlyZXR1cm4gdHJ1ZTsKIAljYXNlIENISVBf
VkVHQTEyOgogCWNhc2UgQ0hJUF9WRUdBMjA6CkBAIC05NTUsNiArOTU2LDcgQEAgc3RhdGljIGlu
dCBnbWNfdjlfMF9tY19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJYWRldi0+
Z21jLmdhcnRfc2l6ZSA9IDUxMlVMTCA8PCAyMDsKIAkJCWJyZWFrOwogCQljYXNlIENISVBfUkFW
RU46ICAgLyogRENFIFNHIHN1cHBvcnQgKi8KKwkJY2FzZSBDSElQX1JFTk9JUjoKIAkJCWFkZXYt
PmdtYy5nYXJ0X3NpemUgPSAxMDI0VUxMIDw8IDIwOwogCQkJYnJlYWs7CiAJCX0KQEAgLTEwMDUs
NiArMTAwNyw3IEBAIHN0YXRpYyB1bnNpZ25lZCBnbWNfdjlfMF9nZXRfdmJpb3NfZmJfc2l6ZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAogCQlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkg
ewogCQljYXNlIENISVBfUkFWRU46CisJCWNhc2UgQ0hJUF9SRU5PSVI6CiAJCQl2aWV3cG9ydCA9
IFJSRUczMl9TT0MxNShEQ0UsIDAsIG1tSFVCUDBfRENTVVJGX1BSSV9WSUVXUE9SVF9ESU1FTlNJ
T04pOwogCQkJc2l6ZSA9IChSRUdfR0VUX0ZJRUxEKHZpZXdwb3J0LAogCQkJCQkgICAgICBIVUJQ
MF9EQ1NVUkZfUFJJX1ZJRVdQT1JUX0RJTUVOU0lPTiwgUFJJX1ZJRVdQT1JUX0hFSUdIVCkgKgpA
QCAtMTA2MSw4ICsxMDY0LDEwIEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfc3dfaW5pdCh2b2lkICpo
YW5kbGUpCiAJY2FzZSBDSElQX1ZFR0ExMDoKIAljYXNlIENISVBfVkVHQTEyOgogCWNhc2UgQ0hJ
UF9WRUdBMjA6CisJY2FzZSBDSElQX1JFTk9JUjoKIAkJYWRldi0+bnVtX3ZtaHVicyA9IDI7CiAK
KwogCQkvKgogCQkgKiBUbyBmdWxmaWxsIDQtbGV2ZWwgcGFnZSBzdXBwb3J0LAogCQkgKiB2bSBz
aXplIGlzIDI1NlRCICg0OGJpdCksIG1heGltdW0gc2l6ZSBvZiBWZWdhMTAsCkBAIC0xMjIzLDYg
KzEyMjgsNyBAQCBzdGF0aWMgdm9pZCBnbWNfdjlfMF9pbml0X2dvbGRlbl9yZWdpc3RlcnMoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJY2FzZSBDSElQX1ZFR0ExMjoKIAkJYnJlYWs7CiAJ
Y2FzZSBDSElQX1JBVkVOOgorCQkvKiBUT0RPIGZvciByZW5vaXIgKi8KIAkJc29jMTVfcHJvZ3Jh
bV9yZWdpc3Rlcl9zZXF1ZW5jZShhZGV2LAogCQkJCQkJZ29sZGVuX3NldHRpbmdzX2F0aHViXzFf
MF8wLAogCQkJCQkJQVJSQVlfU0laRShnb2xkZW5fc2V0dGluZ3NfYXRodWJfMV8wXzApKTsKQEAg
LTEyNTcsNiArMTI2Myw3IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfZ2FydF9lbmFibGUoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAKIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewogCWNh
c2UgQ0hJUF9SQVZFTjoKKwkJLyogVE9ETyBmb3IgcmVub2lyICovCiAJCW1taHViX3YxXzBfdXBk
YXRlX3Bvd2VyX2dhdGluZyhhZGV2LCB0cnVlKTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
