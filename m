Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707EE71ECD
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE006E338;
	Tue, 23 Jul 2019 18:11:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069B46E329
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 17:59:43 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id s145so19455830vke.18
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 10:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=zUOcAU6p00loQ1nrwWD7GDrs3KRhifPlQNEkBCXrSQU=;
 b=DaYFZOdughEVW9YE+oIT+W7lMFrbHxl2QNN9I5p/S66BFzx4OyBPOcZGpFM0p7Q/cm
 3W7a1/wO9SWM9ZFFh2whMUseifRZEoj+/q0U0xBciRtRpqcDyzQAzrmd4hpvwm82pTiG
 TUQqvopvbWmfoplMbSQcrYkTnrQ2EZ4XQQmlMjza5s1MJpiNhVqpD9S/wNGflIE7yCND
 IfU+TzkXsIfMLPFCmfU/VLGdTYLt2PIekuD4mt/ljKjDdrXnDtKKQ7/BQT7TF6YbNZVK
 ujcMT8rxT/P2I16jqM+r8GSv1cf/s9bmqghubQFj8WWjCFTEZszw/pb4N/JwewsyP17s
 qMyQ==
X-Gm-Message-State: APjAAAV1TQEIOvfzfyzTw28wpVkqBPGsglNqaWrjddsFguxBwdCwQwM5
 nj8uqhLAEl2rsaTaE3ZUrhdYuSufd/SIWbRE
X-Google-Smtp-Source: APXvYqwKLPKDYRl/Wu0ROV1RQ4E/ZMl8ZV1EzuXeG4/TJA26mw9Ne5fKh3z8AD7u+iNI3pn1/I9GUafVuAQJAaix
X-Received: by 2002:a67:d60e:: with SMTP id n14mr49253950vsj.213.1563904781800; 
 Tue, 23 Jul 2019 10:59:41 -0700 (PDT)
Date: Tue, 23 Jul 2019 19:58:48 +0200
In-Reply-To: <cover.1563904656.git.andreyknvl@google.com>
Message-Id: <7969018013a67ddbbf784ac7afeea5a57b1e2bcb.1563904656.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1563904656.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v19 11/15] IB/mlx4: untag user pointers in mlx4_get_umem_mr
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
 bh=zUOcAU6p00loQ1nrwWD7GDrs3KRhifPlQNEkBCXrSQU=;
 b=VYKldQtWxdBSrLk5sLC9xz+aQwiA+p9laEjbuJhQ+y14MW59AQItVZb4XUBX4o3STS
 L9JnHbRkn9qNr1J9IZZM0iJZeAOF+VZrFXTsiwFOiScu2zQivLlflg4hR7bzjUfOiPul
 +YlOCB2JPa3W1380wQB/LrhFWVtaDyOhlYe6qKxweJSR67HRGh68c9IWX3GDOjZKGFb5
 Q62/4pR5YzdGLIAhcCOdymu1+C97aJhL6hmlz2Cb/a02TQdVA66PchqiCSNf3yPDUKCI
 sPIwmB/L8x0Lmk1aIlxXadTx8+U7n7WnYlELCxDnDvSJNs7fU1kWK2fSsF6MBML60HXD
 zTzw==
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
 Jason Gunthorpe <jgg@mellanox.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
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
dHMuCgptbHg0X2dldF91bWVtX21yKCkgdXNlcyBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZvciB2
bWEgbG9va3Vwcywgd2hpY2ggY2FuCm9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJz
LgoKVW50YWcgdXNlciBwb2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgoKUmV2aWV3ZWQtYnk6IEph
c29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KQWNrZWQtYnk6IENhdGFsaW4gTWFyaW5h
cyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+ClJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNj
b29rQGNocm9taXVtLm9yZz4KU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5
a252bEBnb29nbGUuY29tPgotLS0KIGRyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg0L21yLmMgfCA3
ICsrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDQvbXIuYyBiL2RyaXZlcnMv
aW5maW5pYmFuZC9ody9tbHg0L21yLmMKaW5kZXggNzUzNDc5Mjg1Y2U5Li42YWU1MDNjZmM1MjYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg0L21yLmMKKysrIGIvZHJpdmVy
cy9pbmZpbmliYW5kL2h3L21seDQvbXIuYwpAQCAtMzc3LDYgKzM3Nyw3IEBAIHN0YXRpYyBzdHJ1
Y3QgaWJfdW1lbSAqbWx4NF9nZXRfdW1lbV9tcihzdHJ1Y3QgaWJfdWRhdGEgKnVkYXRhLCB1NjQg
c3RhcnQsCiAJICogYWdhaW4KIAkgKi8KIAlpZiAoIWliX2FjY2Vzc193cml0YWJsZShhY2Nlc3Nf
ZmxhZ3MpKSB7CisJCXVuc2lnbmVkIGxvbmcgdW50YWdnZWRfc3RhcnQgPSB1bnRhZ2dlZF9hZGRy
KHN0YXJ0KTsKIAkJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7CiAKIAkJZG93bl9yZWFkKCZj
dXJyZW50LT5tbS0+bW1hcF9zZW0pOwpAQCAtMzg1LDkgKzM4Niw5IEBAIHN0YXRpYyBzdHJ1Y3Qg
aWJfdW1lbSAqbWx4NF9nZXRfdW1lbV9tcihzdHJ1Y3QgaWJfdWRhdGEgKnVkYXRhLCB1NjQgc3Rh
cnQsCiAJCSAqIGNvdmVyIHRoZSBtZW1vcnksIGJ1dCBmb3Igbm93IGl0IHJlcXVpcmVzIGEgc2lu
Z2xlIHZtYSB0bwogCQkgKiBlbnRpcmVseSBjb3ZlciB0aGUgTVIgdG8gc3VwcG9ydCBSTyBtYXBw
aW5ncy4KIAkJICovCi0JCXZtYSA9IGZpbmRfdm1hKGN1cnJlbnQtPm1tLCBzdGFydCk7Ci0JCWlm
ICh2bWEgJiYgdm1hLT52bV9lbmQgPj0gc3RhcnQgKyBsZW5ndGggJiYKLQkJICAgIHZtYS0+dm1f
c3RhcnQgPD0gc3RhcnQpIHsKKwkJdm1hID0gZmluZF92bWEoY3VycmVudC0+bW0sIHVudGFnZ2Vk
X3N0YXJ0KTsKKwkJaWYgKHZtYSAmJiB2bWEtPnZtX2VuZCA+PSB1bnRhZ2dlZF9zdGFydCArIGxl
bmd0aCAmJgorCQkgICAgdm1hLT52bV9zdGFydCA8PSB1bnRhZ2dlZF9zdGFydCkgewogCQkJaWYg
KHZtYS0+dm1fZmxhZ3MgJiBWTV9XUklURSkKIAkJCQlhY2Nlc3NfZmxhZ3MgfD0gSUJfQUNDRVNT
X0xPQ0FMX1dSSVRFOwogCQl9IGVsc2UgewotLSAKMi4yMi4wLjcwOS5nMTAyMzAyMTQ3Yi1nb29n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
