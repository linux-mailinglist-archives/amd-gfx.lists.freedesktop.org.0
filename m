Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74D260275
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 10:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A346E44E;
	Fri,  5 Jul 2019 08:42:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756836E2E1
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 08:05:10 +0000 (UTC)
Received: from mail-pl1-f198.google.com ([209.85.214.198])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1hiwjs-0003X6-Js
 for amd-gfx@lists.freedesktop.org; Thu, 04 Jul 2019 08:05:08 +0000
Received: by mail-pl1-f198.google.com with SMTP id u6so1572680plr.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 04 Jul 2019 01:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=MB98UKPyyGKQK9XoTYccJHq4MpFq1w6jxcJ4BZAdBfM=;
 b=qlQDWqKTzUf8nRho1BEqLevLV2JBZzvorZDUkN2Jl4390bPGQSMKNXgixi/1zqyIyP
 ZQkrLglxWz4OIDD3EzYHvSJQjeRPJBvS28ZXkg/0HsnW3I/KxbQ34FyfZKu5gEJSrWZV
 ADSydH30fItyckQ37xMRUp6StHKoYQwoKrlXzVBtNnZwACyWZlt9X7PzDLtrSekN2kg+
 R1aB7l5GBB3G+1OG7cgTMvNnqzo5ZwErpRc8j7u/igsvEAQLXFM+QNxA2eRz1Tyb45q/
 uGwji0Eat6jhPlNS7m6Gd5QXO7YhKP9ekdkG9cc8P9MZ7Lm2+2O5iUK5dJhAwOPzY2Mz
 ztHA==
X-Gm-Message-State: APjAAAVd3ySMuvN36GeaSTK/r0bA1harUFzXXvYID+qP0owwOsaSa32r
 nKJVC0afUeNdKMdsa/Q3AYumRrAGuRrkqaeNhc/UYJOtNt8Uvg+SC3HhCI4pPIgoNrvF1bdPiys
 A87IbEuLm1uCnBVQC9eiTbk6jzQyoYWt1HIULL2IH8R8=
X-Received: by 2002:a63:7e1d:: with SMTP id z29mr11119461pgc.346.1562227506997; 
 Thu, 04 Jul 2019 01:05:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzNdm1bPrbSj8+WIt30/ajqL4poce7JH1x7lz9iLNqYcUx4xjAhi2hNhMlVLo5K+ZtVRx7fJQ==
X-Received: by 2002:a63:7e1d:: with SMTP id z29mr11119429pgc.346.1562227506675; 
 Thu, 04 Jul 2019 01:05:06 -0700 (PDT)
Received: from 2001-b011-380f-3511-3ce8-a904-adca-54a4.dynamic-ip6.hinet.net
 (2001-b011-380f-3511-3ce8-a904-adca-54a4.dynamic-ip6.hinet.net.
 [2001:b011:380f:3511:3ce8:a904:adca:54a4])
 by smtp.gmail.com with ESMTPSA id k5sm4196421pjl.32.2019.07.04.01.05.05
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 01:05:06 -0700 (PDT)
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Where do I file AMDGPU bugs nowadays?
Message-Id: <F62DB80F-3151-405A-BF14-A5B04831115A@canonical.com>
Date: Thu, 4 Jul 2019 16:05:04 +0800
To: amd-gfx list <amd-gfx@lists.freedesktop.org>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:42:04 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQU1ER1BVIGZvbGtzLAoKSeKAmXZlIGZpbGVkIGEgYnVnIFsxXSBhIHdoaWxlIGJhY2ssIGJ1
dCBubyByZXNwb25zZSBzbyBmYXIuCkkgd29uZGVyIGlmIHlvdSBzdGlsbCB1c2UgQkZPPyBPciBk
byB5b3UgbWlncmF0ZSB0byBhbm90aGVyIGJ1ZyB0cmFja2luZyAgCnN5c3RlbT8KClsxXWh0dHBz
Oi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMDg4NgoKS2FpLUhlbmcK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
