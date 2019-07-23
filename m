Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D1E71ED2
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5466E334;
	Tue, 23 Jul 2019 18:11:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D696E328
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 17:59:16 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id y9so19896310ybq.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 10:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=JFgaWDMGqAls6G489iThigfOi0kr7eFjggN3NFe6qBQ=;
 b=CiPqCvmO0b3sqowc7P9pFNNvr/Qnmljew5DKEBWlLRaGY8DyLlq2Z+pwTNIpCvSOE0
 8zPOmUXiXs0S4Bsx2LTskciALBEjE3eiAc260Kkdu9n2c6kCG6NxMlc59pgM3kYDjOdy
 /pjpRYwD/oTtUeqJFco5D90TqY5AHF4/du30Olam5DNEg1ropCq1L2aUVAi+La7y5+dG
 qtcQE+CLZZK24BC8ylWniUNnmzT/oUNGA6liRgTUky2gLfg7V931dInzKJxvermr6vRM
 4ncWIMVK7tN87udguZtMsbWrAlfTMIg93hP1hv8mVxkJ1+fEnjuwfsSWGJN8aZyO4OfM
 f0fg==
X-Gm-Message-State: APjAAAV9xgokLZLebI0tcGQZb7Eth79mA5ZHrUWuypA9sJGGaVSIpX9A
 KP9lbC+TyX/j0jHEijgT/xUUNK977EEzg4Np
X-Google-Smtp-Source: APXvYqyP8TuTil7EZTQQhTgA2DwZYNvsIYk2hVJOr9gyh7gqwx0FC8mj4nBRBXxdbEE2muRKlx89y5GRj7Mj4rf4
X-Received: by 2002:a81:9c0b:: with SMTP id m11mr45173898ywa.3.1563904755656; 
 Tue, 23 Jul 2019 10:59:15 -0700 (PDT)
Date: Tue, 23 Jul 2019 19:58:40 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <c5a78bcad3e94d6cda71fcaa60a423231ae71e4c.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 03/15] lib: untag user pointers in strn*_user
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:11:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=JFgaWDMGqAls6G489iThigfOi0kr7eFjggN3NFe6qBQ=;
 b=bdR5/fk0JGKoW7w0SFkFyWDsbkS1I0veDFpzyivmTwHIiT1ZA97yr7ZNBj0H2AShr3
 pJNPC/lixw/WX323ImP4bsjq93mjJZOu3XmkpNpFXgCiVzkeEYaOnJlxDz/E8gDEr+0Z
 7c+WyXnemQpO1dfLw6iPwN48OpAMyrI2pHKz9BmhLCsXRKcJ8hMZ0q56McGVdIPQVUpC
 wU6S0XoQlY0qPAb6VoXtHP5wFmiEaCJNy21C3scQNSBD97gIywyYsw0LYzCg0A9GdhDR
 +widw+4UdtR8VyNJh7brTEfaRq+BSrao4/hRns/7LOx28RgrtCz6SeEtUQ8FFyTY31id
 9AMg==
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
dHMuCgpzdHJuY3B5X2Zyb21fdXNlciBhbmQgc3Rybmxlbl91c2VyIGFjY2VwdCB1c2VyIGFkZHJl
c3NlcyBhcyBhcmd1bWVudHMsIGFuZApkbyBub3QgZ28gdGhyb3VnaCB0aGUgc2FtZSBwYXRoIGFz
IGNvcHlfZnJvbV91c2VyIGFuZCBvdGhlcnMsIHNvIGhlcmUgd2UKbmVlZCB0byBoYW5kbGUgdGhl
IGNhc2Ugb2YgdGFnZ2VkIHVzZXIgYWRkcmVzc2VzIHNlcGFyYXRlbHkuCgpVbnRhZyB1c2VyIHBv
aW50ZXJzIHBhc3NlZCB0byB0aGVzZSBmdW5jdGlvbnMuCgpOb3RlLCB0aGF0IHRoaXMgcGF0Y2gg
b25seSB0ZW1wb3JhcmlseSB1bnRhZ3MgdGhlIHBvaW50ZXJzIHRvIHBlcmZvcm0KdmFsaWRpdHkg
Y2hlY2tzLCBidXQgdGhlbiB1c2VzIHRoZW0gYXMgaXMgdG8gcGVyZm9ybSB1c2VyIG1lbW9yeSBh
Y2Nlc3Nlcy4KClJldmlld2VkLWJ5OiBWaW5jZW56byBGcmFzY2lubyA8dmluY2Vuem8uZnJhc2Np
bm9AYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEtoYWxpZCBBeml6IDxraGFsaWQuYXppekBvcmFjbGUu
Y29tPgpBY2tlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+ClJldmlld2Vk
LWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0tLQogbGliL3N0
cm5jcHlfZnJvbV91c2VyLmMgfCAzICsrLQogbGliL3N0cm5sZW5fdXNlci5jICAgICAgfCAzICsr
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbGliL3N0cm5jcHlfZnJvbV91c2VyLmMgYi9saWIvc3RybmNweV9mcm9tX3VzZXIu
YwppbmRleCAwMjNiYTlmM2I5OWYuLmRjY2I5NWFmNjAwMyAxMDA2NDQKLS0tIGEvbGliL3N0cm5j
cHlfZnJvbV91c2VyLmMKKysrIGIvbGliL3N0cm5jcHlfZnJvbV91c2VyLmMKQEAgLTYsNiArNiw3
IEBACiAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5o
PgogI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+CisjaW5jbHVkZSA8bGludXgvbW0uaD4KIAogI2lu
Y2x1ZGUgPGFzbS9ieXRlb3JkZXIuaD4KICNpbmNsdWRlIDxhc20vd29yZC1hdC1hLXRpbWUuaD4K
QEAgLTEwOCw3ICsxMDksNyBAQCBsb25nIHN0cm5jcHlfZnJvbV91c2VyKGNoYXIgKmRzdCwgY29u
c3QgY2hhciBfX3VzZXIgKnNyYywgbG9uZyBjb3VudCkKIAkJcmV0dXJuIDA7CiAKIAltYXhfYWRk
ciA9IHVzZXJfYWRkcl9tYXgoKTsKLQlzcmNfYWRkciA9ICh1bnNpZ25lZCBsb25nKXNyYzsKKwlz
cmNfYWRkciA9ICh1bnNpZ25lZCBsb25nKXVudGFnZ2VkX2FkZHIoc3JjKTsKIAlpZiAobGlrZWx5
KHNyY19hZGRyIDwgbWF4X2FkZHIpKSB7CiAJCXVuc2lnbmVkIGxvbmcgbWF4ID0gbWF4X2FkZHIg
LSBzcmNfYWRkcjsKIAkJbG9uZyByZXR2YWw7CmRpZmYgLS1naXQgYS9saWIvc3Rybmxlbl91c2Vy
LmMgYi9saWIvc3Rybmxlbl91c2VyLmMKaW5kZXggN2YyZGIzZmUzMTFmLi4yOGZmNTU0YTFiZTgg
MTAwNjQ0Ci0tLSBhL2xpYi9zdHJubGVuX3VzZXIuYworKysgYi9saWIvc3Rybmxlbl91c2VyLmMK
QEAgLTIsNiArMiw3IEBACiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+CiAjaW5jbHVkZSA8bGlu
dXgvZXhwb3J0Lmg+CiAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgorI2luY2x1ZGUgPGxpbnV4
L21tLmg+CiAKICNpbmNsdWRlIDxhc20vd29yZC1hdC1hLXRpbWUuaD4KIApAQCAtMTA5LDcgKzEx
MCw3IEBAIGxvbmcgc3Rybmxlbl91c2VyKGNvbnN0IGNoYXIgX191c2VyICpzdHIsIGxvbmcgY291
bnQpCiAJCXJldHVybiAwOwogCiAJbWF4X2FkZHIgPSB1c2VyX2FkZHJfbWF4KCk7Ci0Jc3JjX2Fk
ZHIgPSAodW5zaWduZWQgbG9uZylzdHI7CisJc3JjX2FkZHIgPSAodW5zaWduZWQgbG9uZyl1bnRh
Z2dlZF9hZGRyKHN0cik7CiAJaWYgKGxpa2VseShzcmNfYWRkciA8IG1heF9hZGRyKSkgewogCQl1
bnNpZ25lZCBsb25nIG1heCA9IG1heF9hZGRyIC0gc3JjX2FkZHI7CiAJCWxvbmcgcmV0dmFsOwot
LSAKMi4yMi4wLjcwOS5nMTAyMzAyMTQ3Yi1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
