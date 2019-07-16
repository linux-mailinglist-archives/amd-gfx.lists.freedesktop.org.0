Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027DD6A03A
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 03:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D04089EAC;
	Tue, 16 Jul 2019 01:27:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B479A89F24
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 01:27:52 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a15so17753793qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 18:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lwrddfcvbOZjdslYulLn9WBv+3mTkKb1F5B7T03qeA4=;
 b=fo3LMv0yZBueHJdjL6VTmnE33qdHdOmyYm9Y6ujXZ20FkwrEYQsrg/U0pAKnBnJi6v
 IN/OFCkfG4wCVAzjuTKaky8TNUgJY85kpz1fPg4QINndrt+/dxKolUuU5635tRimCqbu
 EsYUtnvillgTBCWgUvZUke59znCN0/VMXNWe6sIAzgGP89++VqO1nbe8IOJ7yIzg/yvD
 8604Vxurl6n44mgQxPta5D1iHc/qQPKEgrdOhPKv8RMo548nHHUw+KDBne5CB9PVYjwR
 FigcWLm53qomDLpkQNPe5B6UpZm1luXoN6/NJ5HtfSBaS+/KnV1QF1KRwqUDzsr6Aw0a
 DLuA==
X-Gm-Message-State: APjAAAWFe/ZKGNWGM80LlpOjIK3vwMbgyT1vymlkvckQqc6o3x6eOm09
 s3MHC5t2MRxI5TRIyDsEnw8e935L
X-Google-Smtp-Source: APXvYqxrL9qOSjjKYEPPh6dpCJ4CfT5LFec+VfkiIEKkz6PB5RH9utx4T30RGF+BwXvXAU7nwdpoJA==
X-Received: by 2002:ac8:d9:: with SMTP id d25mr20861438qtg.29.1563240471719;
 Mon, 15 Jul 2019 18:27:51 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q17sm4285380qtl.13.2019.07.15.18.27.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 18:27:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 093/102] drm/amdgpu: skip gfx 9 common golden settings for arct
Date: Mon, 15 Jul 2019 20:27:32 -0500
Message-Id: <20190716012741.32036-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716012741.32036-1-alexander.deucher@amd.com>
References: <20190716012741.32036-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lwrddfcvbOZjdslYulLn9WBv+3mTkKb1F5B7T03qeA4=;
 b=ICGgSc5+0WjxgSrfvrHK5WmsDT2Pxrc4XiFMB3yo6ipyP85vO5rw2UxfSR+zoaLdhD
 6CH+D8zYyL8Qf9cpdTQIILj5djW1SRO+6iIhcapJI75XXRc/FhG69hnZsutvq97QcdWU
 rQMg2vW0OmMm/0oxniRk5e++tvxBdWCUHVpdJStNhfuVrULXhnIV9fRztMBoadV0PETz
 AnPsNqjerXNQmJwuAqg1ngfJ+LcIaL0UX2cKhX7TvikfI0BjzK4D7XXMXJEVyl6BeoyY
 IoJkgl4vqqp34JYLeGYzrF9q1jNgO2KOLvkmCsIhw6/0Cxdm/BQOAwWjgQppc10/7gVV
 m+SA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKVGhleSBhcmUgbm90
IG5lZWRlZCBieSBhcmN0CgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpo
YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBGZWlmZWkgWHUgPEZlaWZlaS5YdUBhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDUgKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OV8wLmMKaW5kZXggODFmODk2YjRhYTZkLi41YWY2MGUxYzczNWEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtMzg2LDggKzM4Niw5IEBAIHN0
YXRpYyB2b2lkIGdmeF92OV8wX2luaXRfZ29sZGVuX3JlZ2lzdGVycyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKIAkJYnJlYWs7CiAJfQogCi0Jc29jMTVfcHJvZ3JhbV9yZWdpc3Rlcl9zZXF1
ZW5jZShhZGV2LCBnb2xkZW5fc2V0dGluZ3NfZ2NfOV94X2NvbW1vbiwKLQkJCQkJKGNvbnN0IHUz
MilBUlJBWV9TSVpFKGdvbGRlbl9zZXR0aW5nc19nY185X3hfY29tbW9uKSk7CisJaWYgKGFkZXYt
PmFzaWNfdHlwZSAhPSBDSElQX0FSQ1RVUlVTKQorCQlzb2MxNV9wcm9ncmFtX3JlZ2lzdGVyX3Nl
cXVlbmNlKGFkZXYsIGdvbGRlbl9zZXR0aW5nc19nY185X3hfY29tbW9uLAorCQkJCQkJKGNvbnN0
IHUzMilBUlJBWV9TSVpFKGdvbGRlbl9zZXR0aW5nc19nY185X3hfY29tbW9uKSk7CiB9CiAKIHN0
YXRpYyB2b2lkIGdmeF92OV8wX3NjcmF0Y2hfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
