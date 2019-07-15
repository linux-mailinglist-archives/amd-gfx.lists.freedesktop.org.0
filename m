Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC3F69E41
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D6889FE6;
	Mon, 15 Jul 2019 21:25:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F6289FAC
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:55 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id r21so12893920qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kYDhlQeeHhNYTFCKdWaTbtUZWOam8QKxV6IP+fO8EX8=;
 b=CWZb8ocymHY9dRv9J0fUs5F5UvdeYNBQp9S0BPOasZAkz0JjOpvq8Gk3jlEe9u7Wvk
 6ow3oeRvTlOHZdmZlJgx0ps4eW/pGecDcj5ayUGuI49yiu5FVtRwcO9uLwAA5GOxB831
 9dzEcyFwIFjsVafEAplPGXq3XjKQwXItgN+bu4vZHPdhd1osdHaEUBs3B3SEf/nSI8f+
 UoPdzddPoQ8TWNVJV43+rDQgi7eiAYaW59g1xdL7sT4BfAdYJNjbAb8+ittKFWNyAosy
 qAol1srYkA8nOY7RYi1CO07LOjuLf5bc+rKAoongID+XM9COOJjptgSqchcj2Mr+hJEP
 Q9fQ==
X-Gm-Message-State: APjAAAXlWr67ABPGJBEmgu1ndTU7LOz/pRsy/65jUz93EJZljr8C1ZMp
 Ir3Zc0D43SFz3nWws121doW+KYPi
X-Google-Smtp-Source: APXvYqwX/9zqAiQtLr2CFGih6rzm3hfxrHUTb8Y3zSD4hN6MnlG5UGbm1CO+lTLByXRA2sfR2pcClA==
X-Received: by 2002:a05:620a:15f0:: with SMTP id
 p16mr18421652qkm.141.1563225954161; 
 Mon, 15 Jul 2019 14:25:54 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 076/102] drm/amdgpu/: add ucodeID for 2nd vcn instance
Date: Mon, 15 Jul 2019 16:24:11 -0500
Message-Id: <20190715212437.31793-74-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kYDhlQeeHhNYTFCKdWaTbtUZWOam8QKxV6IP+fO8EX8=;
 b=Bqnll6WVikDFIHPzAo9ajeKM9123/VokkqDSMOqizGCKkJu9UtPRxhOLsrRRUkYP++
 UC4nbuqs9mt/z4AV35uKuWd83/ew03zMV+1drP9Z2E2mD+eT0X7CqNTUpY/FUinUGCG7
 D3/O48SJYhRVH6Vwp03Y7iqJRnWnuK41TeFLtZppDl+7TulYtm62bRH3w6pzd9yvRSnC
 p2/28dS5GOIQyLBZ3jFXhFKxRxN5GFDvKJfs2+l/gyPwlVFCw01edQ5+WhEE2+LUZ1mm
 8W1whZnLoRczWPK4NSsF6rF094ckb+A6RgDh3sK95Uljq4D1qc/SJQKF5Keho28wNkog
 l8pA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KCmFkZCB1Y29kZUlEIGZvciAybmQg
dmNuIGluc3RhbmNlCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBaaHUgPEphbWVzLlpodUBhbWQuY29t
PgpSZXZpZXdlZC1ieTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV91Y29kZS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmgKaW5k
ZXggYzFmYjZkYzg2NDQwLi4yYmUxMDZlODFlZGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV91Y29kZS5oCkBAIC0yODEsNiArMjgxLDcgQEAgZW51bSBBTURHUFVfVUNPREVf
SUQgewogCUFNREdQVV9VQ09ERV9JRF9VVkQxLAogCUFNREdQVV9VQ09ERV9JRF9WQ0UsCiAJQU1E
R1BVX1VDT0RFX0lEX1ZDTiwKKwlBTURHUFVfVUNPREVfSURfVkNOMSwKIAlBTURHUFVfVUNPREVf
SURfRE1DVV9FUkFNLAogCUFNREdQVV9VQ09ERV9JRF9ETUNVX0lOVFYsCiAJQU1ER1BVX1VDT0RF
X0lEX1ZDTjBfUkFNLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
