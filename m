Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2C158B5E
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 22:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443F889850;
	Thu, 27 Jun 2019 20:04:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760226E358;
 Thu, 27 Jun 2019 17:36:02 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id d126so1584293pfd.2;
 Thu, 27 Jun 2019 10:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=12AyxFRnGJTFUoiiKdiSfwhatqGTVYkB7zK+n7S66ho=;
 b=AdDc1w2B/jbg4/788W+7AUxoYGwNUPOxzwhXW8iwse6SJtD69dVD8kwe0OvuIdpQRo
 f2jHHMkZuCNjmFL942oulAc3MNUfHLVjXkc5ykuEtfeeBv7EbqUlLuQE+HlCNuRVJgLM
 5Itpnwbu5zvtKy7e5E8zs+UJ9GpTOFXP9JzpjmiUCtou/36boo0LXms1qntW8rilMzNE
 jcMxuSVmJYqSwsuEzRd+1FTF27dB6lQQH22snc0vEqY1Q1/f4Tjjg1XgR1KYcHt0kVqf
 oLS9ywCw9DxshZ8wXJgEKy7XJBj27AdCLDAx4mmZpUeqp4/uKb1KWB+yZU7kO65CQhI8
 7+Zg==
X-Gm-Message-State: APjAAAWUHcsGuN3QQjBW+/elF+uUYyy9Pi9MhUo0p1k1RbsACDRsPJxp
 Z90jXTLYvx3CkuGc3cJF/2U=
X-Google-Smtp-Source: APXvYqyR5XvNIWESHWAGfLobAFZmd4VmL0Inll2lIYRoBHAuhJI7iLpzCgRUuoRXBi5wjN5alDeXyw==
X-Received: by 2002:a17:90a:8a17:: with SMTP id
 w23mr7195171pjn.139.1561656961986; 
 Thu, 27 Jun 2019 10:36:01 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id u20sm3245627pfm.145.2019.06.27.10.35.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 10:36:01 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH 14/87] gpu: amd: Remove call to memset after kzalloc
Date: Fri, 28 Jun 2019 01:35:52 +0800
Message-Id: <20190627173553.2561-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Thu, 27 Jun 2019 20:04:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=12AyxFRnGJTFUoiiKdiSfwhatqGTVYkB7zK+n7S66ho=;
 b=aTN0oUfnkii4ZuE43WoaWkdIADMd01xwCsj58JaW4GjQkbBQR5Z0I2Ckj6XVJoRmLG
 5vTVFPOpbErhLk/ja3TRlpLQ4gGeDpa0IZMkkLy7VkNeiEQjF70GIVA9ms782AxL9FPC
 6ySb+IjaZJFSPcYx6Z1mdUj8v4eudfV/oU4tXzgcE3Kal4FqKI/S8+WJevdLpx0+uozY
 lOKpao/BI1j8LpgwO+VQmDUNn2GQoLlUtNPb6OPMfFzz9UqRV+KrGfEtaTv2d6cqcqew
 J3XPZR4ibG0zE89f6E0WnkLk8EyeNqKd9JjvXunBPPFwDhMCRyikPYrOFT0qbojwQEmC
 S71g==
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Francis <David.Francis@amd.com>,
 Fuqian Huang <huangfq.daxian@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

a3phbGxvYyBhbHJlYWR5IHplcm9yZWQgdGhlIG1lbW9yeS4Kc28gbWVtc2V0IGlzIHVubmVlZGVk
LgoKU2lnbmVkLW9mZi1ieTogRnVxaWFuIEh1YW5nIDxodWFuZ2ZxLmRheGlhbkBnbWFpbC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faXJx
LmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9pcnEuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2lycS5jCmluZGV4
IGZkMjJiNDQ3NGRiZi4uNGU2ZGE2MWQxYTkzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9pcnEuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9pcnEuYwpAQCAtMjc5LDggKzI3OSw2
IEBAIHZvaWQgKmFtZGdwdV9kbV9pcnFfcmVnaXN0ZXJfaW50ZXJydXB0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LAogCQlyZXR1cm4gREFMX0lOVkFMSURfSVJRX0hBTkRMRVJfSURYOwogCX0K
IAotCW1lbXNldChoYW5kbGVyX2RhdGEsIDAsIHNpemVvZigqaGFuZGxlcl9kYXRhKSk7Ci0KIAlp
bml0X2hhbmRsZXJfY29tbW9uX2RhdGEoaGFuZGxlcl9kYXRhLCBpaCwgaGFuZGxlcl9hcmdzLCAm
YWRldi0+ZG0pOwogCiAJaXJxX3NvdXJjZSA9IGludF9wYXJhbXMtPmlycV9zb3VyY2U7Ci0tIAoy
LjExLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
