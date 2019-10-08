Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C4DD006E
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 20:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A976E87E;
	Tue,  8 Oct 2019 18:05:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37636E87E
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 18:05:25 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id v52so3886013qtb.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 08 Oct 2019 11:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B5tKz9k+SIE8lQsvpxmbJubVEOIoUowvUiZXM/T94bc=;
 b=Ehfy7iD/ETj7aIOrQDHaJCGeI3TwTY6iB7qM2YRKHiir7Kupq/iwLM+WvpyYJeQ51y
 1P+sJibQnd1VYEiggBXS7yZbummlQmKsOBN2FCwRfW1LSyXCEM/ba2Ya6gm44e6SpTu1
 VnAa7XLxPTsl6TixElWL/ocd+fWnreT/95IJ+O5g0qsS/h4r+UweH/J90m7c+v9Pb2GY
 6OBLZQlL2TFqgo3FFhV+wr45xyp5riN47Wva5PrGNCKtWEIb3TwW/mR4fbnZCBD570zu
 s22j4KK4Ro9nCXWT9NDTPlNH0DTBTYVzIqnAvT0RzKELTrEXEdeEqX8Xk8N7fxmWWqRM
 Ee8g==
X-Gm-Message-State: APjAAAXXUHyj7uN5hGnCuIicUPDpFAsqd1HmopAjHfjnKULSchGWSydt
 mmaYMB7ZSLTF/KauekvT7DY2wjlC
X-Google-Smtp-Source: APXvYqyFrgTYxzuK3/GBFZxspvFEEwhYtoBIcNV9nZhvnKYaRN3qgBC8N7oREDoleDCi3zjy2qzNWw==
X-Received: by 2002:a0c:f84d:: with SMTP id g13mr34560402qvo.217.1570557924301; 
 Tue, 08 Oct 2019 11:05:24 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id h29sm11732395qtb.46.2019.10.08.11.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 11:05:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/ras: fix typos in documentation
Date: Tue,  8 Oct 2019 13:05:17 -0500
Message-Id: <20191008180517.31668-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B5tKz9k+SIE8lQsvpxmbJubVEOIoUowvUiZXM/T94bc=;
 b=NbaOmx+Ed1n/oN27rjp47nfkSe7yiZRjOZg2E+3JLOra9BQnhUlEeYB4mHg+E+cDiT
 nI5QhIhaFzSv3LDuWHnBnEL13g6gEXYjy/yjMsYZ66UxOsQtadi3IMbFjvHsNKEiJ8eo
 jjmgiWwe1VCH9DQN0/RTHoRPZMLV06CdDnAngGq7FswFCs4E4QbWdKZkCklTd4TI0EoR
 WFtUAEW2CfWX6GtbvMVh9Wc9/Fnwj1ah0lkuZaU3u1ZpL2M2VuHd3GUEzVIjbypNb9t3
 ZGRhaOmxggttIz2MzLxr5OFXZcuoOPnuLctNtEByh7DDzkzczSeS5CzwDQ+EhVVsoPiE
 FWmQ==
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

Rml4IGEgY291cGxlIG9mIHNwZWxsaW5nIHR5cG9zLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMKaW5kZXggMGUyZWU1ODY5YjVmLi5jMGQzZWRmNzc5MDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTIyOCwxMyArMjI4LDEzIEBAIHN0YXRpYyBzdHJ1Y3Qg
cmFzX21hbmFnZXIgKmFtZGdwdV9yYXNfZmluZF9vYmooc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCiAgKgogICogLi4gY29kZS1ibG9jazo6IGJhc2gKICAqCi0gKgllY2hvIG9wIGJsb2NrIFtl
cnJvciBbc3ViX2JsY29rIGFkZHJlc3MgdmFsdWVdXSA+IC4uLi9yYXMvcmFzX2N0cmwKKyAqCWVj
aG8gb3AgYmxvY2sgW2Vycm9yIFtzdWJfYmxvY2sgYWRkcmVzcyB2YWx1ZV1dID4gLi4uL3Jhcy9y
YXNfY3RybAogICoKICAqIG9wOiBkaXNhYmxlLCBlbmFibGUsIGluamVjdAogICoJZGlzYWJsZTog
b25seSBibG9jayBpcyBuZWVkZWQKICAqCWVuYWJsZTogYmxvY2sgYW5kIGVycm9yIGFyZSBuZWVk
ZWQKICAqCWluamVjdDogZXJyb3IsIGFkZHJlc3MsIHZhbHVlIGFyZSBuZWVkZWQKLSAqIGJsb2Nr
OiB1bWMsIHNtZGEsIGdmeCwgLi4uLi4uLi4uCisgKiBibG9jazogdW1jLCBzZG1hLCBnZngsIC4u
Li4uLi4uLgogICoJc2VlIHJhc19ibG9ja19zdHJpbmdbXSBmb3IgZGV0YWlscwogICogZXJyb3I6
IHVlLCBjZQogICoJdWU6IG11bHRpX3VuY29ycmVjdGFibGUKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
