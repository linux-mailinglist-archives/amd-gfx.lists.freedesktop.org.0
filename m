Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F39A04C851
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 09:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75426E552;
	Thu, 20 Jun 2019 07:22:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C596E41F
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 14:45:14 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id l19so9780544pgh.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 07:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8fT/vuEA7OU0dJVEYE3r7kPp1EiCp3ty74wiME2Ad6k=;
 b=QjSH8AWSVSPtWhcG9wVF7sKUEvbJgqxZ9eudOzRW8ouc6Y8p4iDeqQKeFGg+zHscO/
 QYwYeV6M7kquK+HYw67s3D2zBLW2CJuXqZePnzZUT6ZsryPioyMcgIRybjSYpeQkM7o2
 NqOtwg4oPeskBrtWSVZd2Y+eq4OzjDqPMkgu13bCxOTDxptxJE6H8rr9FQQ5hz7a7z3Y
 upCF7+NdZosSWcIjIqxblLheogzaVxO3W3vqw2McLaw5ZRLs1QUAEg6qjf2vuU5z2BfA
 rx5bPTwfxoQnA1sglsTDNA/4qeNl/N6jfUBWek+msD64EIdyjF7r8mrxJ4Amq5uFVoGz
 C/mQ==
X-Gm-Message-State: APjAAAV6qbreaP3hVYB3CKsfqQZVRW5CBhFeLv5NBE7v2O7JlUh2cXsf
 V5jwBex9FsOF7oqOhTvHN6Kp9Fcvcul4i1aElBjtZA==
X-Google-Smtp-Source: APXvYqxml1AJCp6VXxhzIr0ScKXgidc4P55u7fkRG0uKH1TmixS7V2epvHYKLjz4L0moJR3Tz7zj8BeYkr14oUMqT1c=
X-Received: by 2002:a17:90a:a116:: with SMTP id
 s22mr11521374pjp.47.1560955513903; 
 Wed, 19 Jun 2019 07:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
 <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
In-Reply-To: <a7a2933bea5fe57e504891b7eec7e9432e5e1c1a.1560339705.git.andreyknvl@google.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 19 Jun 2019 16:45:02 +0200
Message-ID: <CAAeHK+xvtqALY9DESF048mR17Po=W++QwWOUOOeSXKgriVTC-w@mail.gmail.com>
Subject: Re: [PATCH v17 03/15] arm64: Introduce prctl() options to control the
 tagged user addresses ABI
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:22:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8fT/vuEA7OU0dJVEYE3r7kPp1EiCp3ty74wiME2Ad6k=;
 b=EvIEznAc2XDTlXpBOjY12Pc2q1rIxcWk6U40JWRUJTQeG8doG5XM7cV9g4/aAvpAbm
 r3Vk1xob0ZSfzJTTT+FaHc9R0h1eLHkawgh+Y2HeR9XjGIs5zVJz5vVbm53lpriaFfb7
 WLyV/uAQNAYVDSY/FjIXmEn/qRI4X4yYKhErVQMtfpicAASkyevJQubb5nypERO8S2Td
 5b/ik5O20WuHwXvtTFgmOoa0CziwFqCIOtcjre2VZ/5fgyUl+9VVN5r0dUvXPdBUWYAX
 74ptz4qqjfqvUzObFkRm/Ek6sICgg7UMvCYbjzj6hCVv3sQaFa6vMFhwyadaNP4W/A/J
 GtIg==
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

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTo0MyBQTSBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlr
bnZsQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGlu
Lm1hcmluYXNAYXJtLmNvbT4KPgo+IEl0IGlzIG5vdCBkZXNpcmFibGUgdG8gcmVsYXggdGhlIEFC
SSB0byBhbGxvdyB0YWdnZWQgdXNlciBhZGRyZXNzZXMgaW50bwo+IHRoZSBrZXJuZWwgaW5kaXNj
cmltaW5hdGVseS4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgcHJjdGwoKSBpbnRlcmZhY2UKPiBm
b3IgZW5hYmxpbmcgb3IgZGlzYWJsaW5nIHRoZSB0YWdnZWQgQUJJIHdpdGggYSBnbG9iYWwgc3lz
Y3RsIGNvbnRyb2wKPiBmb3IgcHJldmVudGluZyBhcHBsaWNhdGlvbnMgZnJvbSBlbmFibGluZyB0
aGUgcmVsYXhlZCBBQkkgKG1lYW50IGZvcgo+IHRlc3RpbmcgdXNlci1zcGFjZSBwcmN0bCgpIHJl
dHVybiBlcnJvciBjaGVja2luZyB3aXRob3V0IHJlY29uZmlndXJpbmcKPiB0aGUga2VybmVsKS4g
VGhlIEFCSSBwcm9wZXJ0aWVzIGFyZSBpbmhlcml0ZWQgYnkgdGhyZWFkcyBvZiB0aGUgc2FtZQo+
IGFwcGxpY2F0aW9uIGFuZCBmb3JrKCknZWQgY2hpbGRyZW4gYnV0IGNsZWFyZWQgb24gZXhlY3Zl
KCkuCj4KPiBUaGUgUFJfU0VUX1RBR0dFRF9BRERSX0NUUkwgd2lsbCBiZSBleHBhbmRlZCBpbiB0
aGUgZnV0dXJlIHRvIGhhbmRsZQo+IE1URS1zcGVjaWZpYyBzZXR0aW5ncyBsaWtlIGltcHJlY2lz
ZSB2cyBwcmVjaXNlIGV4Y2VwdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDYXRhbGluIE1hcmlu
YXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgoKQ2F0YWxpbiwgd291bGQgeW91IGxpa2UgdG8g
ZG8gdGhlIHJlcXVlc3RlZCBjaGFuZ2VzIHRvIHRoaXMgcGF0Y2gKeW91cnNlbGYgYW5kIHNlbmQg
aXQgdG8gbWUgb3Igc2hvdWxkIEkgZG8gdGhhdD8KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
