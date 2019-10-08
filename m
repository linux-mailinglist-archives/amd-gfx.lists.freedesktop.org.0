Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28320D007B
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 20:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD1C6E881;
	Tue,  8 Oct 2019 18:09:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AFC6E881
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 18:09:25 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id p10so17627520qkg.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 08 Oct 2019 11:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jEqdnnRWvmQK1GRhQv3+L2haXzwSoHqoNav6SArfJQw=;
 b=DbqlTwH94STA6xSikLeCikkpDiiP6RnR2/hMa4r5OheoG/CrCGywXIEVph+U5gseFc
 Kw6E28KfHTM0MTFNoHCHepPsRqWOYTKzHxzeiyOUvLHOa73NZ3bjN48dg1WBDUtkhuC5
 /VqD529HFOrQseT87nClF9pHJORiemEag6iU7pFUgKqJWdcCwQYOprxOP9CLweTU56TC
 J+MmSrmFyiWrm80JA3hLUe9IEC8Ip57DW/Ui+yIYrgxZB5DEPrri5opVlNiUcm3czgTh
 6TFmleqf+FvTZPg+vSRvOKx0j8u4PyWAZqBC8CTC+R628Mdvz5lgmwqSPIvxfTLaBO+l
 a20Q==
X-Gm-Message-State: APjAAAXvhPB/BP7uTx5qVVxN9JtNRnrq9Hw4OFs+eaGaY9KoBj6UboEk
 wIFPVozG04/CPQSz7wo5a8iL2B/U
X-Google-Smtp-Source: APXvYqxYaZs9ryIpIcacYWnJOC9jg/B81fN65yQZhrVzKcO8UAj9F2jkNOduRUGEgbWxVLIcKciOTg==
X-Received: by 2002:a37:2c44:: with SMTP id s65mr10578798qkh.303.1570558164379; 
 Tue, 08 Oct 2019 11:09:24 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id c185sm10312607qkg.74.2019.10.08.11.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 11:09:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/ras: document the reboot ras option
Date: Tue,  8 Oct 2019 13:09:15 -0500
Message-Id: <20191008180915.31877-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jEqdnnRWvmQK1GRhQv3+L2haXzwSoHqoNav6SArfJQw=;
 b=OcbQLzZ7QxaC7cbeFeXChulHSPYEb1jEh2twDjWhDXDfhiiCmbYipVwxOBMIkpA1xG
 ZpAuwx/ObPS43UakzViSK/43OxqxjjzZYArzp+OacSH+xsbcX8XL6RuN3QfEymvmbmwl
 OllLLrlCZTbdXmedgK7MCv01AuQIVTF3ZqwYV22/h1UPVOsD4P4JffZDFgGjXJWQQKw9
 0AZbNDih6TO1VblIFOfdcFJlo68sA/HEB+fvpjsNxFFi3EvyUqJeyj/5Rr+77bzYVJrd
 lqc282FXS+V006MvhTQCQ1YdZ70BJKROVA/c/9UJ5z8Ou2pEYZls9+AFwHDPXjVG1dzo
 NI7A==
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

V2UgcmVjZW50bHkgYWRkZWQgaXQsIGJ1dCBuZXZlciBkb2N1bWVudGVkIGl0LgoKU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5jCmluZGV4IGMwZDNlZGY3NzkwMS4uODRkOGMzMzQyYTgxIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC0yMTUsMTEgKzIxNSwxMiBAQCBz
dGF0aWMgc3RydWN0IHJhc19tYW5hZ2VyICphbWRncHVfcmFzX2ZpbmRfb2JqKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LAogICogdmFsdWUgdG8gdGhlIGFkZHJlc3MuCiAgKgogICogU2Vjb25k
IG1lbWJlcjogc3RydWN0IHJhc19kZWJ1Z19pZjo6b3AuCi0gKiBJdCBoYXMgdGhyZWUga2luZHMg
b2Ygb3BlcmF0aW9ucy4KKyAqIEl0IGhhcyBmb3VyIGtpbmRzIG9mIG9wZXJhdGlvbnMuCiAgKgog
ICogLSAwOiBkaXNhYmxlIFJBUyBvbiB0aGUgYmxvY2suIFRha2UgOjpoZWFkIGFzIGl0cyBkYXRh
LgogICogLSAxOiBlbmFibGUgUkFTIG9uIHRoZSBibG9jay4gVGFrZSA6OmhlYWQgYXMgaXRzIGRh
dGEuCiAgKiAtIDI6IGluamVjdCBlcnJvcnMgb24gdGhlIGJsb2NrLiBUYWtlIDo6aW5qZWN0IGFz
IGl0cyBkYXRhLgorICogLSAzOiByZWJvb3Qgb24gdW5yZWNvdmVyYWJsZSBlcnJvcgogICoKICAq
IEhvdyB0byB1c2UgdGhlIGludGVyZmFjZT8KICAqIHByb2dyYW1zOgotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
