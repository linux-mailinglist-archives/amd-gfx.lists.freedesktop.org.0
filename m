Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49830D2DAC
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 17:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B736EB40;
	Thu, 10 Oct 2019 15:26:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB086EB71
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 15:26:35 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id h126so5951052qke.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 08:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H+GmfzILfxIS4W8FX6GbomdoKUg6LoPcKNo8KP7Y4pk=;
 b=COIpu+v7zV6iLuu+BWjh9EjmOE39BTv7XOH4Nr16XisP7nvtiAT9cyYiltZJ2uuIv1
 mEfiotf2OwuZnh3vAHzG0qjLjt8ONS39amWmNvX4WxEXJEHAwuC4UdhM1Jljoxs4lk4z
 0gG5TnkA1QoOyWSZGu/6mWWGW30QxhL3Zg01SyM4/FM0j4CWGNidMDGzt7aEiwneqCBB
 n9ui4EQ6ti+aYAXVQf140hgKF+c+fHaLfMprauawEjuBi/JRBrbr2wLkm2xWysUTgp/s
 zAv0p2A2SBxryn+z+7gKlij702Cg4vi8U9+rejCch8nbu1N6dMSLdxCft6TSJmQZzzJ/
 VBZA==
X-Gm-Message-State: APjAAAWkTEnzkNhaz0i7QjB46L4zzdUf/++mWqMrTDBMYUOaA/p8dR8w
 0z6Rr+khz4q8KYdr1paerDli0VIe
X-Google-Smtp-Source: APXvYqyQrYxmr9hHHdaFjkLy4vjZSBF2BfN5qLj5HtfmGCGAUxidnnwwWtmfVi8c55zuDlSLfC81gw==
X-Received: by 2002:a37:2fc1:: with SMTP id v184mr10462009qkh.18.1570721194548; 
 Thu, 10 Oct 2019 08:26:34 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id w45sm3389610qtb.47.2019.10.10.08.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 08:26:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/5] drm/amdgpu: move pci_save_state into suspend path
Date: Thu, 10 Oct 2019 10:26:15 -0500
Message-Id: <20191010152619.31011-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191010152619.31011-1-alexander.deucher@amd.com>
References: <20191010152619.31011-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H+GmfzILfxIS4W8FX6GbomdoKUg6LoPcKNo8KP7Y4pk=;
 b=nLG2GePJkDrssk/3t4i1xLjSVabukwP2ZJsdKQyImpiu5OPu0+JjEz4DnGk8LP7imB
 nYbY0ivskwe8bZ1Twnn7BrDc5+z54C/B8b3Ot0n+b/K6O/B6m7piSSwTQB3LIyzhWblo
 CDthKcfxaBvqHgkbk9BOiE3QOjHMH3T7ZilMZeizsEFHNxyjzOSTRnw2ggkgAvDtha0u
 2Tp1HPNWuhkmmEbO2D+ADrdpkUfMs1gNwlTBrYq+GGWWnWdktCk+NbrAcdy5tm4iPhCQ
 ZFRH0PRDG/JU0EheqQDgHbFdjcTFavjHL/hmHVy73SSzJEJOFwQzCCNP3ePXAdtEBDjg
 RH2Q==
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

Zm9yIGFtZGdwdV9kZXZpY2Vfc3VzcGVuZC4gIFRoaXMgZm9sbG93cyB0aGUgbG9naWMKaW4gdGhl
IHJlc3VtZSBwYXRoLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCBmMjUy
NzVhYmY0MDguLjliOWIxNTM2MDE5NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYwpAQCAtMzE2OCw4ICszMTY4LDggQEAgaW50IGFtZGdwdV9kZXZpY2Vfc3Vz
cGVuZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBib29sIHN1c3BlbmQsIGJvb2wgZmJjb24pCiAJ
ICovCiAJYW1kZ3B1X2JvX2V2aWN0X3ZyYW0oYWRldik7CiAKLQlwY2lfc2F2ZV9zdGF0ZShkZXYt
PnBkZXYpOwogCWlmIChzdXNwZW5kKSB7CisJCXBjaV9zYXZlX3N0YXRlKGRldi0+cGRldik7CiAJ
CS8qIFNodXQgZG93biB0aGUgZGV2aWNlICovCiAJCXBjaV9kaXNhYmxlX2RldmljZShkZXYtPnBk
ZXYpOwogCQlwY2lfc2V0X3Bvd2VyX3N0YXRlKGRldi0+cGRldiwgUENJX0QzaG90KTsKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
