Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D729B87EA1
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FDD6EE4E;
	Fri,  9 Aug 2019 15:53:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29CF6EE4A
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:28 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id g18so725727qkl.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JfN3jOFYJsdbHuTyPGaNsiJDolueXK0Vu+j5PFNwQoY=;
 b=hHmC+QebqLWffm3H3ZgCEPDmwSMxTdjJwT0O4ho5KmqoL17rtu/6+l+8lcmpa6++H2
 +kTVDssp5h4gJMaRPc+IIl0zTkduQeZBxEr3uJqCB/3rm0DWwE2B7WR01sQLIvGM1kBQ
 Wl9tt4AXflWkfGfAriwXqqKVVGjFmT4mailZxA3iuH6g1B2bOrB72HyNmJmO7jwi8OkQ
 l8Iz9JIfZoYacYQ2QFd/KYpxbILHfZcRqdSXw2VS52C6wtrvvE/SW14ibWBv4/lNYr0y
 Aqp/bd+VDBirfqp60cLwCs6KkxyMAG0qm185V0GukRyD3Z77iVKNNd7f2YdW6aui0h0F
 vLog==
X-Gm-Message-State: APjAAAVUMfdilFmwrrYy7/c00T2yAaNh1ZdJuMgTModUJ+ekpFrUddgx
 d93WUdFsMr2jdr8TIxsvgN52mkXb
X-Google-Smtp-Source: APXvYqxCoqmx9NgniK51ddXcwvbWeknFTcV0S94c28MYbVpniuUldXLWO4z19bcWgOTYO4FtfSUuDw==
X-Received: by 2002:a37:717:: with SMTP id 23mr16984904qkh.267.1565366007529; 
 Fri, 09 Aug 2019 08:53:27 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 20/27] drm/amdgpu: add VCN2.0 to Renoir IP blocks
Date: Fri,  9 Aug 2019 10:52:55 -0500
Message-Id: <20190809155302.4733-20-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JfN3jOFYJsdbHuTyPGaNsiJDolueXK0Vu+j5PFNwQoY=;
 b=ix/rh+x5bGxHo1O1McCVfmK9YwDA8kN42Q/JDnZOiqh2snMzRp2eiEGkprlApNYfSR
 Q3UBT0RWyMT3ri26YdQ3jikbnKdVK5FMK7Y9HVJjARd26WiGZgiq7xCSY/DBTYbhfkUv
 RNNhUr1iSpGbP2jjXsMYhcIUqSokhW+QGqIyp5cLeQMolWbmRQYHcPYUxOEGjePBOy4U
 PUBOsZ66YR2CkHZ2YWj37aPYyFhI2uKuBwxfjTYy8qi1ZCwwhOv6gwM+RdRwzMkT39ZZ
 jrg9FAi25xDBl8QFORXVG/v7UCSPcZWtLJTcyHt83s1yx1x/Dg5nBUE24lONFOuIND8i
 lMmQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKVGh1cyBlbmFibGUgVkNOMi4wIGZvciBS
ZW5vaXIKClNpZ25lZC1vZmYtYnk6IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4KUmV2aWV3ZWQt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggNWMxZmRiYzEwYmIz
Li41NDQ2YTgyZDJlOGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAtNjIsNiAr
NjIsNyBAQAogI2luY2x1ZGUgInV2ZF92N18wLmgiCiAjaW5jbHVkZSAidmNlX3Y0XzAuaCIKICNp
bmNsdWRlICJ2Y25fdjFfMC5oIgorI2luY2x1ZGUgInZjbl92Ml8wLmgiCiAjaW5jbHVkZSAidmNu
X3YyXzUuaCIKICNpbmNsdWRlICJkY2VfdmlydHVhbC5oIgogI2luY2x1ZGUgIm14Z3B1X2FpLmgi
CkBAIC03NTMsNiArNzU0LDcgQEAgaW50IHNvYzE1X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzZG1h
X3Y0XzBfaXBfYmxvY2spOwogCQlpZiAoYWRldi0+ZW5hYmxlX3ZpcnR1YWxfZGlzcGxheSB8fCBh
bWRncHVfc3Jpb3ZfdmYoYWRldikpCiAJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2
LCAmZGNlX3ZpcnR1YWxfaXBfYmxvY2spOworCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChh
ZGV2LCAmdmNuX3YyXzBfaXBfYmxvY2spOwogCQlicmVhazsKIAlkZWZhdWx0OgogCQlyZXR1cm4g
LUVJTlZBTDsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
