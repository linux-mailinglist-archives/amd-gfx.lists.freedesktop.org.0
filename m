Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DDE21C96
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 19:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A7A89109;
	Fri, 17 May 2019 17:36:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4642589109
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 17:36:27 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id q197so4937372qke.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 10:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XkvjH0l7AllXD+BLlnVzfrHb4cOMkhdGbd+K3pTShA0=;
 b=CVfu1sYaR81Q6Xzmf11NUm1dbeO8G2Cuh+PGPdWiWnrY9PIwwAKPI7squ/zIyoWYUN
 638kQyfjxekkp0CcGnQ8j1c/+UQG2FMsnpN23EvgHHurc6/FK7WIhSRKgVtLaYWvnNNZ
 UOQ2zHQNs8Y3THEZ0t/t4il3KjNs6MfqyRSLwdaVZNEr1NoVbs/wJ5PDRUOVWJ2hHSb/
 DSie8cv0Jneyz+Zrw1VnXG6dPvEA0YaDTQd2ahdh6z7WpavqtRsrsrb5JOgD3Em/Xyw0
 nIgiqmxa0OEKOOw1NT++ELuvfQozhwCjMBJvBplj1EtCDPhWBHyCwcQhjOqmG/4AfsTB
 A2pA==
X-Gm-Message-State: APjAAAW03Z3UZTTT73zImv6J4hYhjaD32Y1W27AmRCMOV2v7YLjizDYY
 ZSfHCV56xIQn5pIMIPywnAe3akqI
X-Google-Smtp-Source: APXvYqyeJFhswDTHZPMW8HN31Cp0AeEH65En3TTc+E5gMxUvLf+OFOWThrOSwnSA63f7FbGIOmlLug==
X-Received: by 2002:a37:4c1:: with SMTP id 184mr7001416qke.322.1558114586177; 
 Fri, 17 May 2019 10:36:26 -0700 (PDT)
Received: from localhost.localdomain ([71.219.84.143])
 by smtp.gmail.com with ESMTPSA id v13sm4414127qkj.3.2019.05.17.10.36.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 17 May 2019 10:36:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/gmc9: set vram_width properly for SR-IOV
Date: Fri, 17 May 2019 12:36:18 -0500
Message-Id: <20190517173618.14856-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XkvjH0l7AllXD+BLlnVzfrHb4cOMkhdGbd+K3pTShA0=;
 b=n5DqbtoQvpe2CkNSJiONUco3LIr5lycO05qgbru/3FYr5Yv1LBymh4jnnJyLjy9bMh
 VhoLRsA4xiOpiSBGOi4j5AMHeUqlcAqofp2+wyiQUn0KAZcKNLQcTr8xenRteNAJRDrO
 TuK4tkC56CG3GcZ2YbvYoAImsuwswgbdG/DsckYLROvgzJeMe12CFHDKV0hVc0jByFUa
 oGz3ExfTlWXGos1fR2oxLCTN3pTGxNwKGpGxW97oybHUfGn6hYmPNzt2GYyECKPv0+PO
 aF9nVU9cK1eQYBrrG//DfvHhlcLIvz9AMOrB/7KQwOlmhRFn7bJw0CjN8IQRi8NbeOqQ
 5cww==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Yintian.Tao@amd.com,
 Yintian Tao <yttao@amd.com>, Trigger Huang <Trigger.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIFNSLUlPViwgdnJhbV93aWR0aCBjYW4ndCBiZSByZWFkIGZyb20gQVRPTSBhcwpSQVZFTiwg
YW5kIERGIHJlbGF0ZWQgcmVnaXN0ZXJzIGlzIG5vdCByZWFkYWJsZSwgc28gaGFyZGNvcmQKaXMg
dGhlIG9ubHkgd2F5IHRvIHNldCB0aGUgY29ycmVjdCB2cmFtX3dpZHRoLgoKU2lnbmVkLW9mZi1i
eTogVHJpZ2dlciBIdWFuZyA8VHJpZ2dlci5IdWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBZ
aW50aWFuIFRhbyA8eXR0YW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192OV8wLmMgfCAxMCArKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKaW5k
ZXggNTljNTgwYmQ1YTNiLi45NzUwYjYzMmU5YWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3Y5XzAuYwpAQCAtODM1LDggKzgzNSwxNiBAQCBzdGF0aWMgaW50IGdtY192OV8wX21jX2lu
aXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJaW50IGNoYW5zaXplLCBudW1jaGFuOwog
CWludCByOwogCi0JaWYgKGFtZGdwdV9lbXVfbW9kZSAhPSAxKQorCWlmIChhbWRncHVfc3Jpb3Zf
dmYoYWRldikpIHsKKwkJLyogRm9yIFZlZ2ExMCBTUi1JT1YsIHZyYW1fd2lkdGggY2FuJ3QgYmUg
cmVhZCBmcm9tIEFUT00gYXMgUkFWRU4sCisJCSAqIGFuZCBERiByZWxhdGVkIHJlZ2lzdGVycyBp
cyBub3QgcmVhZGFibGUsIHNlZW1zIGhhcmRjb3JkIGlzIHRoZQorCQkgKiBvbmx5IHdheSB0byBz
ZXQgdGhlIGNvcnJlY3QgdnJhbV93aWR0aAorCQkgKi8KKwkJYWRldi0+Z21jLnZyYW1fd2lkdGgg
PSAyMDQ4OworCX0gZWxzZSBpZiAoYW1kZ3B1X2VtdV9tb2RlICE9IDEpIHsKIAkJYWRldi0+Z21j
LnZyYW1fd2lkdGggPSBhbWRncHVfYXRvbWZpcm13YXJlX2dldF92cmFtX3dpZHRoKGFkZXYpOwor
CX0KKwogCWlmICghYWRldi0+Z21jLnZyYW1fd2lkdGgpIHsKIAkJLyogaGJtIG1lbW9yeSBjaGFu
bmVsIHNpemUgKi8KIAkJaWYgKGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSkKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
