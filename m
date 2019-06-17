Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C251349064
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4296E059;
	Mon, 17 Jun 2019 19:50:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69D96E05C
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:27 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id x18so6970869qkn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YcO7ySu6616dRxjiy42Ih1Y+ZzadSIn6+7r/meMwVXs=;
 b=M/RnyyWlSSJ/2WgNxt2Ac6W1VbQ87gxc45AV5PCaaHaRRJEkrk3EOvwxUvzii255lC
 ntb/hIaUan/b1K7cMjFLaqcfjMNA8COXp6YsxBSv7pjquBrtEkvHSkKakxT9AfRzSwvZ
 8oFu80kyFejq0rJz1kbcDuAR8JFhfjvcdvfvaEl32KCzeGvRiB85vD9Q3PmqbEOJ0bhN
 01oIlFr0ptPVoTUXRDcFnR6jwJe+0tVdPh79xzNozI1BAIec3hM1t4aF8v6mFSE0QwCz
 s24/MXw1+gx79WfOulx33Y2Mrm+tiX3tanhIHu0Fkzue6HeGyx3vNCfm4pUZVPt092Ta
 ELFA==
X-Gm-Message-State: APjAAAXwqiGjebL5Q0V7iF2J4JesAozIGQERDxSRojn93mgDaJoiRdcs
 Bb55YesQSQfzQt1w+yxRDy4N+Oxkc9K7CA==
X-Google-Smtp-Source: APXvYqxOCWOyBouXYAenUXFVNVBcj1T/eLIUCl94DKUBbhbdqhHX72YLKVYqJCF4HD2MvbrWps7TWg==
X-Received: by 2002:a05:620a:14ab:: with SMTP id
 x11mr24199655qkj.186.1560801026639; 
 Mon, 17 Jun 2019 12:50:26 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:26 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 430/459] drm/amd/display: Use DCN2 functions instead of DCE
Date: Mon, 17 Jun 2019 14:49:19 -0500
Message-Id: <20190617194948.18667-31-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YcO7ySu6616dRxjiy42Ih1Y+ZzadSIn6+7r/meMwVXs=;
 b=aGDYz2fAD768Jto66269XXf7x0mECdzCmTZWvciJRU9hhGctuKEFx0/D6+MtZTWS+V
 64MqllnBiRNZfRNZyqYOO9p0ITwzNbQFzJtIKvTSbSzEjB44yHKQutqlfW05S43EA6DQ
 g8ssDyNlQx6Su0204E8eJumCPPFvgcS+CKiYa9Y+Y4ce1xNmGVDd3Qi+zgNu+MVGwDh7
 XSOWf776Tt24k7vjUXeayDLCZSgzBuq7aGpi4ohTHjPMv0nFwgv9UzZY/OJFpGBb/9gZ
 Y/f8+6ajI4qU00ZJQGCCjz8k2I/ojNaxVeZp21P1NF0VuQZrHs5lBqS1/CDf+GGNhDfG
 /RNg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VzbGV5IENoYWxtZXJzIDxXZXNsZXkuQ2hhbG1lcnNAYW1kLmNvbT4KCltXSFldCkRD
TiBjb2RlIHNob3VsZCBtYWtlIGFzIGZldyByZWZlcmVuY2VzIHRvIERDRSBhcyBwb3NzaWJsZQoK
W0hPV10KQ29weSBEQ0UxMTAgaW1wbGVtZW50YXRpb24gb2YgZmluZF9maXJzdF9mcmVlX21hdGNo
X3N0cmVhbV9lbmNfZm9yX2xpbmsKaW50byBEQ04xMAoKU2lnbmVkLW9mZi1ieTogV2VzbGV5IENo
YWxtZXJzIDxXZXNsZXkuQ2hhbG1lcnNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFRvbnkgQ2hlbmcg
PFRvbnkuQ2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5w
cmVldC5MYWtoYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3Jlc291cmNlLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKaW5kZXggOGI0ODUzZGQ0ZmQ0Li5jYWViZjQ3
NDY0NzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9yZXNvdXJjZS5jCkBAIC00MCw2ICs0MCw3IEBACiAjaW5jbHVkZSAiZGNuMjBfb3B0
Yy5oIgogI2luY2x1ZGUgImRjbjIwX2h3c2VxLmgiCiAjaW5jbHVkZSAiZGNlMTEwL2RjZTExMF9o
d19zZXF1ZW5jZXIuaCIKKyNpbmNsdWRlICJkY24xMC9kY24xMF9yZXNvdXJjZS5oIgogI2luY2x1
ZGUgImRjbjIwX29wcC5oIgogCiAjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQK
QEAgLTI0NDgsNyArMjQ0OSw3IEBAIHN0YXRpYyBzdHJ1Y3QgcmVzb3VyY2VfZnVuY3MgZGNuMjBf
cmVzX3Bvb2xfZnVuY3MgPSB7CiAJLmFkZF9kc2NfdG9fc3RyZWFtX3Jlc291cmNlID0gZGNuMjBf
YWRkX2RzY190b19zdHJlYW1fcmVzb3VyY2UsCiAJLnJlbW92ZV9kc2NfZnJvbV9zdHJlYW1fcmVz
b3VyY2UgPSBkY24yMF9yZW1vdmVfZHNjX2Zyb21fc3RyZWFtX3Jlc291cmNlLAogI2VuZGlmCi0J
LmZpbmRfZmlyc3RfZnJlZV9tYXRjaF9zdHJlYW1fZW5jX2Zvcl9saW5rID0gZGNlMTEwX2ZpbmRf
Zmlyc3RfZnJlZV9tYXRjaF9zdHJlYW1fZW5jX2Zvcl9saW5rCisJLmZpbmRfZmlyc3RfZnJlZV9t
YXRjaF9zdHJlYW1fZW5jX2Zvcl9saW5rID0gZGNuMTBfZmluZF9maXJzdF9mcmVlX21hdGNoX3N0
cmVhbV9lbmNfZm9yX2xpbmsKIH07CiAKIGJvb2wgZGNuMjBfZHdiY19jcmVhdGUoc3RydWN0IGRj
X2NvbnRleHQgKmN0eCwgc3RydWN0IHJlc291cmNlX3Bvb2wgKnBvb2wpCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
