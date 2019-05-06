Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9521D1529D
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 19:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C27489B27;
	Mon,  6 May 2019 17:19:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD27289AB5
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 16:31:38 +0000 (UTC)
Received: by mail-yw1-xc49.google.com with SMTP id q188so7872416ywc.15
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 May 2019 09:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XsLXWNDlsBBI0M98p6y9Vt03OYjBcfLHAOwfOkL6Mk8=;
 b=ov7yCkzPASqAhJ7G1G22qMKJgdefYmaExdSltbI7fSBkRNIHGTeE/vH28e0aiRLPyd
 c7vJVmk0wz5l4WJJo6+c+7vXv+Wy/iSofehxPotPJyzH4+JPNbSnShDi3mff5+tr+iAD
 1AuM9PFzwadd/w1A79ch3XTV9HvJMBDDixK2N5eRqUz9WI1uZtybLfS6E2gFy/e7Lxdp
 MqSwyYzlT2hxsjHQFcyCxwB7BUhb0e9emh/PzyyCXUkxNPGgc38ZMzcCG6uznWqma7oZ
 Q6E4BgE/GYHiVibW2234O96JeRNkwsGhsZBj9cADGflzLSChRxH6GTOPMh6JurO3/xK1
 Rhvg==
X-Gm-Message-State: APjAAAVb/0t9cF+gzyEKZiRKReX2TAxau4IlDHEGkThanz2+jR6qP7aK
 Uz27UGnDm14HmEX34QAi+qZFZjfnTdtT363Q
X-Google-Smtp-Source: APXvYqynTJlFStkm7itRuyZbu5fDIV0oTx6a8awLBBeIPofcOk875PcBne7EkMsm55r8chxW1lodIy8g+/aDw2aV
X-Received: by 2002:a81:7903:: with SMTP id u3mr17016403ywc.478.1557160297906; 
 Mon, 06 May 2019 09:31:37 -0700 (PDT)
Date: Mon,  6 May 2019 18:30:56 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <30b44d469bb545c608531faf01fb10248ed78887.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 10/17] fs, arm64: untag user pointers in fs/userfaultfd.c
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Mon, 06 May 2019 17:19:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=XsLXWNDlsBBI0M98p6y9Vt03OYjBcfLHAOwfOkL6Mk8=;
 b=kEClrhOVjhAItZ8ad4444tIss3a4M0x8Yot0yP0UgDJhkHPz5JJSrKt8hPGcBCGy4k
 n4A8xX+jnj6SxUqb5Teq0gUiCKNzkVcA04YhcbUNwlyz4R1O6RfjMZcPvXzWJ1RdceKB
 oQhTiP7SkvbOtmqbJ2RUuk4j1OYZLTrgQf9mkPglzFxH/VOrmTQ4nsN9RjYlhUC2s+eh
 3RVGdXHQ+PFLeCy7nvUg/hvDRpVltVdy/tgWDjXNd7yymqhFMcWgbq1pcJP1+YPDmRyD
 x5gmgR7lpn+iTAg+S4pO9Zaw/FFLdxShW6UDAYaJnd95g7v5e/84elY+8pkkjOlGa4Nw
 P+ag==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>, Lee Smith <Lee.Smith@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9w
IGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCnRoYW4gMHgwMCkgYXMgc3lzY2FsbCBh
cmd1bWVudHMuCgp1c2VyZmF1bHRmZCBjb2RlIHVzZSBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZv
ciB2bWEgbG9va3Vwcywgd2hpY2ggY2FuCm9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50
ZXJzLgoKVW50YWcgdXNlciBwb2ludGVycyBpbiB2YWxpZGF0ZV9yYW5nZSgpLgoKU2lnbmVkLW9m
Zi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGZzL3Vz
ZXJmYXVsdGZkLmMgfCAyMiArKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvdXNlcmZh
dWx0ZmQuYyBiL2ZzL3VzZXJmYXVsdGZkLmMKaW5kZXggZjVkZTFlNzI2MzU2Li5hYTQ3ZWQwOTY5
ZGQgMTAwNjQ0Ci0tLSBhL2ZzL3VzZXJmYXVsdGZkLmMKKysrIGIvZnMvdXNlcmZhdWx0ZmQuYwpA
QCAtMTI2MSwyMSArMTI2MSwyMyBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgd2FrZV91
c2VyZmF1bHQoc3RydWN0IHVzZXJmYXVsdGZkX2N0eCAqY3R4LAogfQogCiBzdGF0aWMgX19hbHdh
eXNfaW5saW5lIGludCB2YWxpZGF0ZV9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwKLQkJCQkJ
ICBfX3U2NCBzdGFydCwgX191NjQgbGVuKQorCQkJCQkgIF9fdTY0ICpzdGFydCwgX191NjQgbGVu
KQogewogCV9fdTY0IHRhc2tfc2l6ZSA9IG1tLT50YXNrX3NpemU7CiAKLQlpZiAoc3RhcnQgJiB+
UEFHRV9NQVNLKQorCSpzdGFydCA9IHVudGFnZ2VkX2FkZHIoKnN0YXJ0KTsKKworCWlmICgqc3Rh
cnQgJiB+UEFHRV9NQVNLKQogCQlyZXR1cm4gLUVJTlZBTDsKIAlpZiAobGVuICYgflBBR0VfTUFT
SykKIAkJcmV0dXJuIC1FSU5WQUw7CiAJaWYgKCFsZW4pCiAJCXJldHVybiAtRUlOVkFMOwotCWlm
IChzdGFydCA8IG1tYXBfbWluX2FkZHIpCisJaWYgKCpzdGFydCA8IG1tYXBfbWluX2FkZHIpCiAJ
CXJldHVybiAtRUlOVkFMOwotCWlmIChzdGFydCA+PSB0YXNrX3NpemUpCisJaWYgKCpzdGFydCA+
PSB0YXNrX3NpemUpCiAJCXJldHVybiAtRUlOVkFMOwotCWlmIChsZW4gPiB0YXNrX3NpemUgLSBz
dGFydCkKKwlpZiAobGVuID4gdGFza19zaXplIC0gKnN0YXJ0KQogCQlyZXR1cm4gLUVJTlZBTDsK
IAlyZXR1cm4gMDsKIH0KQEAgLTEzMjUsNyArMTMyNyw3IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0
ZmRfcmVnaXN0ZXIoc3RydWN0IHVzZXJmYXVsdGZkX2N0eCAqY3R4LAogCQlnb3RvIG91dDsKIAl9
CiAKLQlyZXQgPSB2YWxpZGF0ZV9yYW5nZShtbSwgdWZmZGlvX3JlZ2lzdGVyLnJhbmdlLnN0YXJ0
LAorCXJldCA9IHZhbGlkYXRlX3JhbmdlKG1tLCAmdWZmZGlvX3JlZ2lzdGVyLnJhbmdlLnN0YXJ0
LAogCQkJICAgICB1ZmZkaW9fcmVnaXN0ZXIucmFuZ2UubGVuKTsKIAlpZiAocmV0KQogCQlnb3Rv
IG91dDsKQEAgLTE1MTQsNyArMTUxNiw3IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfdW5yZWdp
c3RlcihzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgsCiAJaWYgKGNvcHlfZnJvbV91c2VyKCZ1
ZmZkaW9fdW5yZWdpc3RlciwgYnVmLCBzaXplb2YodWZmZGlvX3VucmVnaXN0ZXIpKSkKIAkJZ290
byBvdXQ7CiAKLQlyZXQgPSB2YWxpZGF0ZV9yYW5nZShtbSwgdWZmZGlvX3VucmVnaXN0ZXIuc3Rh
cnQsCisJcmV0ID0gdmFsaWRhdGVfcmFuZ2UobW0sICZ1ZmZkaW9fdW5yZWdpc3Rlci5zdGFydCwK
IAkJCSAgICAgdWZmZGlvX3VucmVnaXN0ZXIubGVuKTsKIAlpZiAocmV0KQogCQlnb3RvIG91dDsK
QEAgLTE2NjUsNyArMTY2Nyw3IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfd2FrZShzdHJ1Y3Qg
dXNlcmZhdWx0ZmRfY3R4ICpjdHgsCiAJaWYgKGNvcHlfZnJvbV91c2VyKCZ1ZmZkaW9fd2FrZSwg
YnVmLCBzaXplb2YodWZmZGlvX3dha2UpKSkKIAkJZ290byBvdXQ7CiAKLQlyZXQgPSB2YWxpZGF0
ZV9yYW5nZShjdHgtPm1tLCB1ZmZkaW9fd2FrZS5zdGFydCwgdWZmZGlvX3dha2UubGVuKTsKKwly
ZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1tLCAmdWZmZGlvX3dha2Uuc3RhcnQsIHVmZmRpb193
YWtlLmxlbik7CiAJaWYgKHJldCkKIAkJZ290byBvdXQ7CiAKQEAgLTE3MDUsNyArMTcwNyw3IEBA
IHN0YXRpYyBpbnQgdXNlcmZhdWx0ZmRfY29weShzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgs
CiAJCQkgICBzaXplb2YodWZmZGlvX2NvcHkpLXNpemVvZihfX3M2NCkpKQogCQlnb3RvIG91dDsK
IAotCXJldCA9IHZhbGlkYXRlX3JhbmdlKGN0eC0+bW0sIHVmZmRpb19jb3B5LmRzdCwgdWZmZGlv
X2NvcHkubGVuKTsKKwlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1tLCAmdWZmZGlvX2NvcHku
ZHN0LCB1ZmZkaW9fY29weS5sZW4pOwogCWlmIChyZXQpCiAJCWdvdG8gb3V0OwogCS8qCkBAIC0x
NzYxLDcgKzE3NjMsNyBAQCBzdGF0aWMgaW50IHVzZXJmYXVsdGZkX3plcm9wYWdlKHN0cnVjdCB1
c2VyZmF1bHRmZF9jdHggKmN0eCwKIAkJCSAgIHNpemVvZih1ZmZkaW9femVyb3BhZ2UpLXNpemVv
ZihfX3M2NCkpKQogCQlnb3RvIG91dDsKIAotCXJldCA9IHZhbGlkYXRlX3JhbmdlKGN0eC0+bW0s
IHVmZmRpb196ZXJvcGFnZS5yYW5nZS5zdGFydCwKKwlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgt
Pm1tLCAmdWZmZGlvX3plcm9wYWdlLnJhbmdlLnN0YXJ0LAogCQkJICAgICB1ZmZkaW9femVyb3Bh
Z2UucmFuZ2UubGVuKTsKIAlpZiAocmV0KQogCQlnb3RvIG91dDsKLS0gCjIuMjEuMC4xMDIwLmdm
MjgyMGNmMDFhLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
