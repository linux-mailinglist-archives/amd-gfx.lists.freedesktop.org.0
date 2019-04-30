Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57843FA55
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 15:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360E4891E2;
	Tue, 30 Apr 2019 13:29:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E836C891E2
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 13:25:58 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id i38so9264438qte.18
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 06:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=5l0a3uzMK38mxhU43HR3pLkdTsHYkFU/5p0+WtYx5vA=;
 b=S6KbPpseFSKI021AjWKrcFvfWZq2BXebuDW3QcFRv7tVFPe4LEM3Wx9YNB3WzH+L5A
 8KjidBckzzPzkZYYVNqJ/AJTP5ovH1PX+KdK4cppkQaOW168a76jkOV4bDdeAzBBIziR
 lWof+7alestUW28KBeuZw+fT1Fv+TbjgnE4PZxR4p1ibOk3PWTKe3IlYlL7MVEW58AvR
 AqPCg2nIZQyN1+ntD0zRYtp98aoBeFZAurlVgjBxvkyFeVaPvA3bO2E7pDxcaIHskZiW
 Iltreo9LQk/R0mv6djEch4XNwFkDpiOBuaYhQX8DFPZv+NIWlzxTohPb4elongy7aqGi
 D2nw==
X-Gm-Message-State: APjAAAVxrVN4FqMQmFY3yYQEJHHXCOTfZmsBCFU76Sdpzr3zkye70nwa
 tof0kTNMivT3gizNhN/N249KmoCd/JtBYkyP
X-Google-Smtp-Source: APXvYqzcKJMSJm3saTG/Jy9RV9wnqiRL/1GQ7HSUwiNcvOVWaTtiFz1xHas1LLHxgSsag1rnBPh3sxDf1Qf0ekUW
X-Received: by 2002:a05:6214:18d:: with SMTP id
 q13mr1705396qvr.213.1556630757432; 
 Tue, 30 Apr 2019 06:25:57 -0700 (PDT)
Date: Tue, 30 Apr 2019 15:25:09 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <05c0c078b8b5984af4cc3b105a58c711dcd83342.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 13/17] IB/mlx4,
 arm64: untag user pointers in mlx4_get_umem_mr
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 30 Apr 2019 13:29:06 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=5l0a3uzMK38mxhU43HR3pLkdTsHYkFU/5p0+WtYx5vA=;
 b=g9CCdO8J183ztwieMKtxq5bQgdPwn8MyKUl5zlyySPt09tOB1Gypd0bdF1FTgPWg9U
 vgl3VSH+QbfWqwQxuQNAq18fHGv2grDucix13/YUy3bvOI1BB9BrzAgOyNFI+ychptbo
 BVp24qrS90whe3PqSvAaQ8Kncxvv8pqzjLbVvi9smoyLBamx2Dg/fg59oj/C1VgTZmLk
 po6sIoVdSb935f+/5YJnlpWSaOQYjK3//t7Ql3k3IgbH35nE1TWkeZ08/rMUWbwR2R7Q
 rNZsAyxKMZqUS4nVVdVnnh9Mowjk/e6QvbUTkAZYjeM7AIkIVd6G6w9+5n4IsjstGWE8
 jwFg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Koenig@google.com,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Chintan Pandya <cpandya@codeaurora.org>,
 Felix <Felix.Kuehling@amd.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Kuehling@google.com, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Deucher@google.com,
 Leon Romanovsky <leonro@mellanox.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9w
IGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCnRoYW4gMHgwMCkgYXMgc3lzY2FsbCBh
cmd1bWVudHMuCgptbHg0X2dldF91bWVtX21yKCkgdXNlcyBwcm92aWRlZCB1c2VyIHBvaW50ZXJz
IGZvciB2bWEgbG9va3Vwcywgd2hpY2ggY2FuCm9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBv
aW50ZXJzLgoKVW50YWcgdXNlciBwb2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgoKU2lnbmVkLW9m
Zi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgpSZXZpZXdlZC1i
eTogTGVvbiBSb21hbm92c2t5IDxsZW9ucm9AbWVsbGFub3guY29tPgotLS0KIGRyaXZlcnMvaW5m
aW5pYmFuZC9ody9tbHg0L21yLmMgfCA3ICsrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbmZpbmliYW5k
L2h3L21seDQvbXIuYyBiL2RyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg0L21yLmMKaW5kZXggMzk1
Mzc5YTQ4MGNiLi45YTM1ZWQyYzZhNmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW5maW5pYmFuZC9o
dy9tbHg0L21yLmMKKysrIGIvZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDQvbXIuYwpAQCAtMzc4
LDYgKzM3OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgaWJfdW1lbSAqbWx4NF9nZXRfdW1lbV9tcihzdHJ1
Y3QgaWJfdWRhdGEgKnVkYXRhLCB1NjQgc3RhcnQsCiAJICogYWdhaW4KIAkgKi8KIAlpZiAoIWli
X2FjY2Vzc193cml0YWJsZShhY2Nlc3NfZmxhZ3MpKSB7CisJCXVuc2lnbmVkIGxvbmcgdW50YWdn
ZWRfc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKIAkJc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWE7CiAKIAkJZG93bl9yZWFkKCZjdXJyZW50LT5tbS0+bW1hcF9zZW0pOwpAQCAtMzg2LDkg
KzM4Nyw5IEBAIHN0YXRpYyBzdHJ1Y3QgaWJfdW1lbSAqbWx4NF9nZXRfdW1lbV9tcihzdHJ1Y3Qg
aWJfdWRhdGEgKnVkYXRhLCB1NjQgc3RhcnQsCiAJCSAqIGNvdmVyIHRoZSBtZW1vcnksIGJ1dCBm
b3Igbm93IGl0IHJlcXVpcmVzIGEgc2luZ2xlIHZtYSB0bwogCQkgKiBlbnRpcmVseSBjb3ZlciB0
aGUgTVIgdG8gc3VwcG9ydCBSTyBtYXBwaW5ncy4KIAkJICovCi0JCXZtYSA9IGZpbmRfdm1hKGN1
cnJlbnQtPm1tLCBzdGFydCk7Ci0JCWlmICh2bWEgJiYgdm1hLT52bV9lbmQgPj0gc3RhcnQgKyBs
ZW5ndGggJiYKLQkJICAgIHZtYS0+dm1fc3RhcnQgPD0gc3RhcnQpIHsKKwkJdm1hID0gZmluZF92
bWEoY3VycmVudC0+bW0sIHVudGFnZ2VkX3N0YXJ0KTsKKwkJaWYgKHZtYSAmJiB2bWEtPnZtX2Vu
ZCA+PSB1bnRhZ2dlZF9zdGFydCArIGxlbmd0aCAmJgorCQkgICAgdm1hLT52bV9zdGFydCA8PSB1
bnRhZ2dlZF9zdGFydCkgewogCQkJaWYgKHZtYS0+dm1fZmxhZ3MgJiBWTV9XUklURSkKIAkJCQlh
Y2Nlc3NfZmxhZ3MgfD0gSUJfQUNDRVNTX0xPQ0FMX1dSSVRFOwogCQl9IGVsc2UgewotLSAKMi4y
MS4wLjU5My5nNTExZWMzNDVlMTgtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
