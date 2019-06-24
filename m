Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D6950E91
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 16:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D2089C2A;
	Mon, 24 Jun 2019 14:36:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2E189B69
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 14:33:54 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id o4so16316878qko.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 07:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=N5aQVQiWWtXi9gCv0ztW+dfvhd60giz7b6IoZ6u0OIQ=;
 b=mny+Innjl0ORlUAOiye4hzfoISUp5gt8+0ZGKwwNqye8GFpsf8vLlM/Eu8PuUJ9ncz
 hyPykT8kKe6Ev6xs/GstTF/FwwzrtYBNlqHQPs3FOJAZlRyYNspamDgHiTehO1QBCZTZ
 M/zs01J5BiG/HiS+a8prbTCWILy0udc9hx6BQU3DZtgKfZX8E7ylJCTHLLqvTLQ7eywk
 vrKXOVd8Dyy0auqFwLJpVRPCZRdZfyutswW8H99Ogv8HS9S19Nvu8QPGrtKZOjSQq0lP
 iZm2YNxpABQOBpZn6H71/G5qaxIpdNLBRntqPAmcDvs+isXssJDFNsT1rV18U0wUYzqI
 MMtQ==
X-Gm-Message-State: APjAAAVejhP6B7pwcvpHa0UYuxaYJotZs1dKfl4hiAysaXbt1xnn/HRf
 Ex+WuqLw7ESYtCedbtfJ0GpcQUwt0tm/s96Y
X-Google-Smtp-Source: APXvYqyNi91IprVlCjHeOaEl/XhVal8I6zy0NHm57SSOUiamYjJ/eflME47kK7EATSbEXYL1nBd99divk4S0n0PC
X-Received: by 2002:ae9:e8ce:: with SMTP id
 a197mr16822243qkg.484.1561386833898; 
 Mon, 24 Jun 2019 07:33:53 -0700 (PDT)
Date: Mon, 24 Jun 2019 16:33:00 +0200
In-Reply-To: <cover.1561386715.git.andreyknvl@google.com>
Message-Id: <0999c80cd639b78ae27c0674069d552833227564.1561386715.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v18 15/15] selftests, arm64: add a selftest for passing tagged
 pointers to kernel
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Mon, 24 Jun 2019 14:36:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=N5aQVQiWWtXi9gCv0ztW+dfvhd60giz7b6IoZ6u0OIQ=;
 b=qjhPznbYLqEoUuOd+SbruTmLg2XmfpstnWtNL0BmQkS/9+yQT+WCgWslxOFvIMH1pv
 mALN6TNaetS33pt/RVz6EBDIEWN2quqA6jv67UFd7koLos1e133OMWu359ZPg0J6bPcr
 0XWlGuBxH86U+t+14QRd+rvD4clAF7jsa1nnvo0JS1ZiAdQXZxeWkV8d/rYp0KzGCh88
 IiYVBvmMbwt07ocU9yE6vY4JutitBKtGPSxtSdK50DrOSaBmfZV7Ob9XJeo2Bom5V336
 MrXYPuP6NQaYbAzK3Of68rTmuGoOGsh3GrYLnYHFg0fALTXz/unOR+Jpt7LYdYsFe3Zd
 cEhg==
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
 Kostya Serebryany <kcc@google.com>, Khalid Aziz <khalid.aziz@oracle.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGtlcm5lbCBBQkkg
dG8gYWxsb3cgdG8gcGFzcwp0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUg
c2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyIHRoYW4KMHgwMCkgYXMgc3lzY2FsbCBhcmd1bWVu
dHMuCgpUaGlzIHBhdGNoIGFkZHMgYSBzaW1wbGUgdGVzdCwgdGhhdCBjYWxscyB0aGUgdW5hbWUg
c3lzY2FsbCB3aXRoIGEKdGFnZ2VkIHVzZXIgcG9pbnRlciBhcyBhbiBhcmd1bWVudC4gV2l0aG91
dCB0aGUga2VybmVsIGFjY2VwdGluZyB0YWdnZWQKdXNlciBwb2ludGVycyB0aGUgdGVzdCBmYWls
cyB3aXRoIEVGQVVMVC4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtu
dmxAZ29vZ2xlLmNvbT4KLS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC8uZ2l0aWdu
b3JlICAgICAgfCAgMSArCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9NYWtlZmlsZSAg
ICAgICAgfCAxMSArKysrKysrCiAuLi4vdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvcnVuX3RhZ3Nf
dGVzdC5zaCAgfCAxMiArKysrKysrKwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFn
c190ZXN0LmMgICAgIHwgMjkgKysrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA1
MyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvYXJtNjQvLmdpdGlnbm9yZQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2FybTY0L01ha2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA3NTUgdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvYXJtNjQvcnVuX3RhZ3NfdGVzdC5zaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jCgpkaWZmIC0tZ2l0IGEvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvLmdpdGlnbm9yZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2FybTY0Ly5naXRpZ25vcmUKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MDAwLi5lOGZhZThkNjFlZDYKLS0tIC9kZXYvbnVsbAorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9hcm02NC8uZ2l0aWdub3JlCkBAIC0wLDAgKzEgQEAKK3RhZ3NfdGVzdApkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvTWFrZWZpbGUgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9hcm02NC9NYWtlZmlsZQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwMDAuLmE2MWIyZTc0M2U5OQotLS0gL2Rldi9udWxsCisrKyBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2FybTY0L01ha2VmaWxlCkBAIC0wLDAgKzEsMTEgQEAKKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAKKworIyBBUkNIIGNhbiBiZSBvdmVycmlkZGVuIGJ5IHRoZSB1
c2VyIGZvciBjcm9zcyBjb21waWxpbmcKK0FSQ0ggPz0gJChzaGVsbCB1bmFtZSAtbSAyPi9kZXYv
bnVsbCB8fCBlY2hvIG5vdCkKKworaWZuZXEgKCwkKGZpbHRlciAkKEFSQ0gpLGFhcmNoNjQgYXJt
NjQpKQorVEVTVF9HRU5fUFJPR1MgOj0gdGFnc190ZXN0CitURVNUX1BST0dTIDo9IHJ1bl90YWdz
X3Rlc3Quc2gKK2VuZGlmCisKK2luY2x1ZGUgLi4vbGliLm1rCmRpZmYgLS1naXQgYS90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9ydW5fdGFnc190ZXN0LnNoIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvYXJtNjQvcnVuX3RhZ3NfdGVzdC5zaApuZXcgZmlsZSBtb2RlIDEwMDc1NQppbmRl
eCAwMDAwMDAwMDAwMDAuLjc0NWYxMTM3OTkzMAotLS0gL2Rldi9udWxsCisrKyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2FybTY0L3J1bl90YWdzX3Rlc3Quc2gKQEAgLTAsMCArMSwxMiBAQAor
IyEvYmluL3NoCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisKK2VjaG8gIi0t
LS0tLS0tLS0tLS0tLS0tLS0tIgorZWNobyAicnVubmluZyB0YWdzIHRlc3QiCitlY2hvICItLS0t
LS0tLS0tLS0tLS0tLS0tLSIKKy4vdGFnc190ZXN0CitpZiBbICQ/IC1uZSAwIF07IHRoZW4KKwll
Y2hvICJbRkFJTF0iCitlbHNlCisJZWNobyAiW1BBU1NdIgorZmkKZGlmZiAtLWdpdCBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvYXJtNjQvdGFnc190ZXN0LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMDAwLi4yMmExYjI2NmUzNzMKLS0tIC9kZXYvbnVsbAorKysgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9hcm02NC90YWdzX3Rlc3QuYwpAQCAtMCwwICsxLDI5IEBACisvLyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMAorCisjaW5jbHVkZSA8c3RkaW8uaD4KKyNpbmNsdWRlIDxz
dGRsaWIuaD4KKyNpbmNsdWRlIDx1bmlzdGQuaD4KKyNpbmNsdWRlIDxzdGRpbnQuaD4KKyNpbmNs
dWRlIDxzeXMvcHJjdGwuaD4KKyNpbmNsdWRlIDxzeXMvdXRzbmFtZS5oPgorCisjZGVmaW5lIFNI
SUZUX1RBRyh0YWcpCQkoKHVpbnQ2NF90KSh0YWcpIDw8IDU2KQorI2RlZmluZSBTRVRfVEFHKHB0
ciwgdGFnKQkoKCh1aW50NjRfdCkocHRyKSAmIH5TSElGVF9UQUcoMHhmZikpIHwgXAorCQkJCQlT
SElGVF9UQUcodGFnKSkKKworaW50IG1haW4odm9pZCkKK3sKKwlzdGF0aWMgaW50IHRiaV9lbmFi
bGVkID0gMDsKKwlzdHJ1Y3QgdXRzbmFtZSAqcHRyLCAqdGFnZ2VkX3B0cjsKKwlpbnQgZXJyOwor
CisJaWYgKHByY3RsKFBSX1NFVF9UQUdHRURfQUREUl9DVFJMLCBQUl9UQUdHRURfQUREUl9FTkFC
TEUsIDAsIDAsIDApID09IDApCisJCXRiaV9lbmFibGVkID0gMTsKKwlwdHIgPSAoc3RydWN0IHV0
c25hbWUgKiltYWxsb2Moc2l6ZW9mKCpwdHIpKTsKKwlpZiAodGJpX2VuYWJsZWQpCisJCXRhZ2dl
ZF9wdHIgPSAoc3RydWN0IHV0c25hbWUgKilTRVRfVEFHKHB0ciwgMHg0Mik7CisJZXJyID0gdW5h
bWUodGFnZ2VkX3B0cik7CisJZnJlZShwdHIpOworCisJcmV0dXJuIGVycjsKK30KLS0gCjIuMjIu
MC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
