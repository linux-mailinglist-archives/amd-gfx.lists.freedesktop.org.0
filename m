Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB305D76C
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E455A6E060;
	Tue,  2 Jul 2019 20:29:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0246E05F
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:21 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id m29so51288qtu.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jJwpOhkQJNG4dmdcPEixcS32Pwz70uNVKyzxQFZWlgA=;
 b=rkEHBOcqV7fS+TzXvrohIeFAWmKvbajTDFjy60DZJJB5HJG5QAMGFu2OUCY+/dv3nS
 w3l8QpBQhz9/G1Z2LqCidB8aMkoDKW6sZQaoNifqmuB6YoRJ8XhU58cvSPl4zpA/QcIt
 6McRscViQ2R79VnUC4+sbodga7ZxBewQ0TkeKU+eq/56zQJImPzSRUYqF9sCV3lPZ4Mc
 /LOTb1K6QrDAau36CxeGY/3iqrbf3QU5bP/ZFpRVg/EW2dbZXgZ95I1bcGmzpAK5rSQD
 CV5S3wFVXQ9yiWJOAKwizPBqgpRSpuUzpqSye+Jxx7FsDvclJnFF6TMUXBarGsaydHi6
 6dqA==
X-Gm-Message-State: APjAAAX97GjJzFO9zPQo07zMgXRv1Qq1nQXix05WUm6l/oAEnvOAMcDA
 EKB/ZJQ34oq4SmUQDiLEBLRD+//V5QA=
X-Google-Smtp-Source: APXvYqzwugUc5dUHeSJR83Ebonh8DyUrTFAoRX/svXZfjlASnARJ4ErRnolImUW/2o3fY0KyeIyJ7w==
X-Received: by 2002:a0c:960e:: with SMTP id 14mr28877508qvx.228.1562099360585; 
 Tue, 02 Jul 2019 13:29:20 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 28/53] drm/amdgpu: add ip blocks for navi14
Date: Tue,  2 Jul 2019 15:28:19 -0500
Message-Id: <20190702202844.17001-29-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jJwpOhkQJNG4dmdcPEixcS32Pwz70uNVKyzxQFZWlgA=;
 b=naKaqXk98g8cpEGMmZ975TQV+yJLTbB5ONvC5shvx0c0cZGQp9dTwFnHsbPmusSsYi
 FYuPVThEzKLdR1BBbF125cQ3ryjJu8dYw0EFSf6ONa4KJac71f+xqKbAF6XEwdlaviIp
 Ngt0a57JAY3Cvty+gTrrkphfghpEfSqyR4x2fPA3PXBwp65lzF8A3yYiMTXVmiaJYsai
 POUXqFnaDyOJmiMmZcOgBjJBx9XV7mrJSkqYSC2GFl3SmWHFSluLgbVoAcG2XxUrfxCm
 Ge1iRv9vHC1J+EY39IQ+KkSAikMW2pXZwISLg2EuvJG1Zb9dhYMulmKdqfvM50xEP9oR
 Nq3A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCkFkZCB0aGUgaW5pdGlh
bCBJUCBibG9ja3MgZm9yIG5hdmkxNAoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFv
amllLnl1YW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIHwgNyArKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKaW5kZXggNjQ5
ZGM1YzAxZmY2Li4wOGRiODM4ZGJlNzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwpAQCAtMzYy
LDYgKzM2MiwxMyBAQCBpbnQgbnZfc2V0X2lwX2Jsb2NrcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIAkJaWYgKGFkZXYtPmVuYWJsZV9tZXMpCiAJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2Nr
X2FkZChhZGV2LCAmbWVzX3YxMF8xX2lwX2Jsb2NrKTsKIAkJYnJlYWs7CisJY2FzZSBDSElQX05B
VkkxNDoKKwkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJm52X2NvbW1vbl9pcF9i
bG9jayk7CisJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZnbWNfdjEwXzBfaXBf
YmxvY2spOworCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmbmF2aTEwX2loX2lw
X2Jsb2NrKTsKKwkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmdmeF92MTBfMF9p
cF9ibG9jayk7CisJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzZG1hX3Y1XzBf
aXBfYmxvY2spOworCQlicmVhazsKIAlkZWZhdWx0OgogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
