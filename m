Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E6569E3D
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B27189FAC;
	Mon, 15 Jul 2019 21:25:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE3989F75
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:52 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id z4so17290339qtc.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ahTbdW5KPgKwbDOZVyIXseJmHnx0ltftttCaXfMeYHM=;
 b=Nx6w2cANXSNoxziXAwpg1e1Uf5xxb8vYdURu9U51CWCd2pbvYT0CQq7/SKCBlb8Vdm
 qT89SzJUaJdw4lhosq4Mo1Bz+fLAuesbu/qu3bDfx8PKDuheEuKcg8WZo93Hoa95lzek
 UlMB0zBENC7Fsr/kxEzX74t+MvmWK+3lUhCC2MZQqKgQ4CM7giVsdGmuCTsF3Qh0x2h7
 bQczGPjfH0z16Cwho5CRxSj/FUkwPSO3zefjvf6oyWVaAGV/Y03DwE2mVyrXlhT0ZOlj
 s8qLZPOojd2H81Vx8I2doRYUsU46QpOa3nDQmcdb/CI7zlnyccP1tGeAPnh3WraDm2YU
 WhhA==
X-Gm-Message-State: APjAAAVz41EJj1B7TAz6cH9f+lc9RAC2Ydjg9h0MAuXh1KFBhpdqc6Yn
 jaduXH56j0hx2zxTE2byQfeRr/O1
X-Google-Smtp-Source: APXvYqwNMt0tCiF1P5gRlElaQtTx+XgCnoY57d2IdaLrgaV0m0yHWlReeNbsTvWUXJ28cgEEaRHXVA==
X-Received: by 2002:a0c:b0e4:: with SMTP id p33mr21310768qvc.208.1563225951471; 
 Mon, 15 Jul 2019 14:25:51 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 074/102] drm/amdkfd: Set number of xgmi optimized SDMA engines
 for arcturus
Date: Mon, 15 Jul 2019 16:24:09 -0500
Message-Id: <20190715212437.31793-72-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ahTbdW5KPgKwbDOZVyIXseJmHnx0ltftttCaXfMeYHM=;
 b=EQbWYsNZxtWl+JWo9SUwFEQXzFNEuhhT7W0XX5Y6dEEFcGY83cZkWr5FD6GTR2R73u
 1uxdilqE4uIptA7XG8/jh7OoKdRlzr25NZt5gNeUnaIgCtF3pYRZPQarfPR+TYS+DpR5
 HQX32fEcw8z19taGnhJy+LFSwQ1jrVA3QuP3ucG21YN4Zxtb9kcFHsd+0HVU6L5eJGE4
 iKODyOxzcOP8ya5K7EX6lBN9ThKPw3gMeBLBdv85tmONm2l/XYnCqyfBoL79EJShcLJg
 V3t6PLFvEtIGuj3ojHNUVSfYaGI4Bt7N/bZrlVJSB6x/lwJbPj+sQeEXkkAwM3sjHvL8
 maVw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Yong Zhao <Yong.Zhao@amd.com>,
 Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBPYWsgWmVu
ZyA8T2FrLlplbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwppbmRleCA1MTFiYzI1MjNmMmYuLmNjMjIy
ODljOTJkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwpAQCAtMzI5
LDcgKzMyOSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIGFyY3R1cnVz
X2RldmljZV9pbmZvID0gewogCS5zdXBwb3J0c19jd3NyID0gdHJ1ZSwKIAkubmVlZHNfaW9tbXVf
ZGV2aWNlID0gZmFsc2UsCiAJLm5lZWRzX3BjaV9hdG9taWNzID0gZmFsc2UsCi0JLm51bV9zZG1h
X2VuZ2luZXMgPSA4LAorCS5udW1fc2RtYV9lbmdpbmVzID0gMiwKKwkubnVtX3hnbWlfc2RtYV9l
bmdpbmVzID0gNiwKIAkubnVtX3NkbWFfcXVldWVzX3Blcl9lbmdpbmUgPSA4LAogfTsKIAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
