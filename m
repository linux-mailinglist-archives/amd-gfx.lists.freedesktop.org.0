Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75DF58B5F
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 22:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC186E4D0;
	Thu, 27 Jun 2019 20:04:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3B36E358;
 Thu, 27 Jun 2019 17:36:27 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id m4so1348306pgk.0;
 Thu, 27 Jun 2019 10:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=djbOmnF6Hniyal++I6RQ9+rf+95159OMOzougsG1kEY=;
 b=J5lcyXIfrCxAgPlhSU8TPdZt1F3sp/oni14j4fF8ENNmn6+s8HQgZW0RklY8Ocxd+/
 zFC/TVzMBQjWYN4DDEY7bqM+sqbxmafRllwiPCFjEoRzSbhA8pdyNtl9t6af6aT6uyTd
 4Elqd+zLCdBcqI5USyBdXGkqKoTa5Fmo6LvQ1F701Ty9fontvoxkCuG97yU0NqK9h9I4
 2kMB0EjTYI7eJsL5Q7EPAbqXk3IE36558D4BNv4LkqzOqP4DDCTYAlwcpK1j4atEFQue
 SE6cgXmw2jCM623LLNttAZS8x7I4hEtINS4IuwFpga6+PWTdMwAf8PSYdA2Xfba93bnH
 gosA==
X-Gm-Message-State: APjAAAVDzJFF8So//qRAvcaNZ+sCaTQqOoaFx5tmgh/SiM2NqjwRZfMU
 iMFGWttkPCL/+NOGxo+fdPY=
X-Google-Smtp-Source: APXvYqx/Xwqi/ignbo/Z1tbh8g6pOK+tSYKSCeBLpAPYrBVYKSfFiuE/tqwABNUCP35R88JC+SQ2WQ==
X-Received: by 2002:a63:246:: with SMTP id 67mr4812836pgc.20.1561656986702;
 Thu, 27 Jun 2019 10:36:26 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id t11sm3480237pgb.33.2019.06.27.10.36.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 10:36:26 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH 16/87] gpu: drm: Remove call to memset after kzalloc
Date: Fri, 28 Jun 2019 01:36:16 +0800
Message-Id: <20190627173617.2671-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Thu, 27 Jun 2019 20:04:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=djbOmnF6Hniyal++I6RQ9+rf+95159OMOzougsG1kEY=;
 b=rPQAMbat8vxK3ysLgczuh8UG1lDSUqkf6S3guwwKyXw3uyChl7eIacCLSMLJL5lGwa
 Qp0WHTq/UvZ8GqQedDP97adk43ffxvlxnQBpqshqdZ21vECNMip7cFmC8ZcG2NPmDAmg
 hl8ONQyjIMBHctTi0rdlFCoFZgc9edj3XEgZZWel43s1g+bif9wnTfmxJIbbMhCh9mdT
 QciHEiVmABKli/ayIQgemcl3cb8kVPwG/2w/7nW8NNI3+CcH2Rxjr/x8odrmycaNuHRd
 0yGb7vW0AiobZKj8kp8IQJhCnLk5i3AAjnNWXmRvw/3YzqVS1fpB3zApXb5fe4LagfKE
 hmZg==
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Fuqian Huang <huangfq.daxian@gmail.com>,
 Colin Ian King <colin.king@canonical.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

a3phbGxvYyBoYXMgYWxyZWFkeSB6ZXJvZXMgdGhlIG1lbW9yeS4KU28gbWVtc2V0IGlzIHVubmVl
ZGVkLgoKU2lnbmVkLW9mZi1ieTogRnVxaWFuIEh1YW5nIDxodWFuZ2ZxLmRheGlhbkBnbWFpbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL2NpX3NtdW1nci5j
IHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL2NpX3NtdW1nci5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL2NpX3NtdW1nci5jCmluZGV4IDY2OWJkMGMyYTE2
Yy4uZDU1ZTI2NGM1ZGY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVtZ3IvY2lfc211bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
c211bWdyL2NpX3NtdW1nci5jCkBAIC0yNzAyLDggKzI3MDIsNiBAQCBzdGF0aWMgaW50IGNpX2lu
aXRpYWxpemVfbWNfcmVnX3RhYmxlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAJY2dzX3dyaXRl
X3JlZ2lzdGVyKGh3bWdyLT5kZXZpY2UsIG1tTUNfU0VRX1BNR19DTURfTVJTMl9MUCwgY2dzX3Jl
YWRfcmVnaXN0ZXIoaHdtZ3ItPmRldmljZSwgbW1NQ19QTUdfQ01EX01SUzIpKTsKIAljZ3Nfd3Jp
dGVfcmVnaXN0ZXIoaHdtZ3ItPmRldmljZSwgbW1NQ19TRVFfV1JfQ1RMXzJfTFAsIGNnc19yZWFk
X3JlZ2lzdGVyKGh3bWdyLT5kZXZpY2UsIG1tTUNfU0VRX1dSX0NUTF8yKSk7CiAKLQltZW1zZXQo
dGFibGUsIDB4MDAsIHNpemVvZihwcF9hdG9tY3RybF9tY19yZWdfdGFibGUpKTsKLQogCXJlc3Vs
dCA9IGF0b21jdHJsX2luaXRpYWxpemVfbWNfcmVnX3RhYmxlKGh3bWdyLCBtb2R1bGVfaW5kZXgs
IHRhYmxlKTsKIAogCWlmICgwID09IHJlc3VsdCkKLS0gCjIuMTEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
