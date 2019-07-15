Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3B3698C0
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 18:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CFC899B3;
	Mon, 15 Jul 2019 16:01:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C467D89993
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 16:00:46 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id z75so7922829pgz.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 09:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Q0q/IfCRadymayHol/UUF72+yJ91bYAnFv+xLR30xQ=;
 b=kzoAMmQfb9qS9E2UeTIZFLoFveWLMvdGAtYshdwZpnQAc1StXlNY55C76N1SPKSqWZ
 +al/9OrjhRQ6CVFJVRfimf+MXnRxm4ryMfCmDnAt3q5wXc6AnhHX+5NXH/J1rXpRN2Cu
 pl1+qhyfLDItpkgCAr44xgvOrmMFtYuGwM05EptAU1JgyMKztSqy0hc91Yld36KFUgDt
 shlz0gOsg0zKQgN3F8QKMH5iETqUQlv9QCMiC/BRV6v4sS7Lqx70RXX+YOCgBTXEJDt7
 DWGasXMhbsIcIbBG45XNqpOyuaTBjoo72qkfNGGVuPw38jnw8VvMdkTxJOHZqsQoBsGT
 NgSw==
X-Gm-Message-State: APjAAAVVX6S/bJkEQcvQ8lXG6nb0aDkqdmzoUpYkFHU7RuC9De6ygJxY
 4mNqnV27k6IxK3DkgTOw7WajlTkEqjbrYgxnJAHyxA==
X-Google-Smtp-Source: APXvYqw+s/Xsm1Inj9c3bcQDg7/b3DVU+zlhxUxxhLhtcMSC55W2OaWJF9iNwAodQ+4dHaGR8RmRVxTzfqDyBCor0Ro=
X-Received: by 2002:a17:90a:25c8:: with SMTP id
 k66mr30231713pje.129.1563206445986; 
 Mon, 15 Jul 2019 09:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561386715.git.andreyknvl@google.com>
 <d8e3b9a819e98d6527e506027b173b128a148d3c.1561386715.git.andreyknvl@google.com>
 <20190624175120.GN29120@arrakis.emea.arm.com>
In-Reply-To: <20190624175120.GN29120@arrakis.emea.arm.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 15 Jul 2019 18:00:34 +0200
Message-ID: <CAAeHK+w=Hi2OQSBfRGmw2dG15ctiHoP6DpktyFG7Qo3AohBAgA@mail.gmail.com>
Subject: Re: [PATCH v18 08/15] userfaultfd: untag user pointers
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Mon, 15 Jul 2019 16:01:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7Q0q/IfCRadymayHol/UUF72+yJ91bYAnFv+xLR30xQ=;
 b=awILUWqnOhL8QrLhWTtK3zyGeYzsbGaDmlapw+TJPtpLmDPRw1GP6vt2k8M63kLr39
 ZOpRC9dNiFsjXCuRW9tvX+XJ4TMinqKEg4V9d0/Cohi7g+H0FLJqsymSlujZFTSwFgq+
 HGvo45b5poteQElVP2ylrss//l0SvENb9w0NdEWBIgvpqnNLsaE/1Oq03NG9YiPmMbZi
 8k5Fou1N/CEVlyaSlbvq+wKBgrOUzCIo1B2qg8bQ1mlF2+F/VYvQbx6QNpAS+GS8VYMS
 4d6tYcKUYuIyyU24AI3+kh3w0LS9e+N+YdRnIzCnanxcL1YdF0dX0SOZIdMQqtDbfKe6
 /xuQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, LKML <linux-kernel@vger.kernel.org>,
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

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgNzo1MSBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDI0LCAyMDE5IGF0IDA0OjMy
OjUzUE0gKzAyMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGlzIGEg
cGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMga2VybmVsIEFCSSB0byBhbGxvdyB0byBwYXNz
Cj4gPiB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRvIHNvbWV0
aGluZyBlbHNlIG90aGVyIHRoYW4KPiA+IDB4MDApIGFzIHN5c2NhbGwgYXJndW1lbnRzLgo+ID4K
PiA+IHVzZXJmYXVsdGZkIGNvZGUgdXNlIHByb3ZpZGVkIHVzZXIgcG9pbnRlcnMgZm9yIHZtYSBs
b29rdXBzLCB3aGljaCBjYW4KPiA+IG9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50ZXJz
Lgo+ID4KPiA+IFVudGFnIHVzZXIgcG9pbnRlcnMgaW4gdmFsaWRhdGVfcmFuZ2UoKS4KPiA+Cj4g
PiBSZXZpZXdlZC1ieTogVmluY2Vuem8gRnJhc2Npbm8gPHZpbmNlbnpvLmZyYXNjaW5vQGFybS5j
b20+Cj4gPiBSZXZpZXdlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJt
LmNvbT4KPiA+IFJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4K
PiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNv
bT4KPiA+IC0tLQo+ID4gIGZzL3VzZXJmYXVsdGZkLmMgfCAyMiArKysrKysrKysrKystLS0tLS0t
LS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQo+Cj4gU2FtZSBoZXJlLCBpdCBuZWVkcyBhbiBhY2sgZnJvbSBBbCBWaXJvLgoKSGkgQWwsCgpD
b3VsZCB5b3UgdGFrZSBhIGxvb2sgYXQgdGhpcyBvbmUgYXMgd2VsbCBhbmQgZ2l2ZSB5b3VyIGFj
a2VkLWJ5PwoKVGhhbmtzIQoKPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL3VzZXJmYXVsdGZkLmMgYi9m
cy91c2VyZmF1bHRmZC5jCj4gPiBpbmRleCBhZTBiOGI1ZjY5ZTYuLmMyYmUzNmExNjhjYSAxMDA2
NDQKPiA+IC0tLSBhL2ZzL3VzZXJmYXVsdGZkLmMKPiA+ICsrKyBiL2ZzL3VzZXJmYXVsdGZkLmMK
PiA+IEBAIC0xMjYxLDIxICsxMjYxLDIzIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCB3
YWtlX3VzZXJmYXVsdChzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgsCj4gPiAgfQo+ID4KPiA+
ICBzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCB2YWxpZGF0ZV9yYW5nZShzdHJ1Y3QgbW1fc3Ry
dWN0ICptbSwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX3U2
NCBzdGFydCwgX191NjQgbGVuKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF9fdTY0ICpzdGFydCwgX191NjQgbGVuKQo+ID4gIHsKPiA+ICAgICAgIF9fdTY0IHRh
c2tfc2l6ZSA9IG1tLT50YXNrX3NpemU7Cj4gPgo+ID4gLSAgICAgaWYgKHN0YXJ0ICYgflBBR0Vf
TUFTSykKPiA+ICsgICAgICpzdGFydCA9IHVudGFnZ2VkX2FkZHIoKnN0YXJ0KTsKPiA+ICsKPiA+
ICsgICAgIGlmICgqc3RhcnQgJiB+UEFHRV9NQVNLKQo+ID4gICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiA+ICAgICAgIGlmIChsZW4gJiB+UEFHRV9NQVNLKQo+ID4gICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPiA+ICAgICAgIGlmICghbGVuKQo+ID4gICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiA+IC0gICAgIGlmIChzdGFydCA8IG1tYXBfbWluX2FkZHIpCj4gPiAr
ICAgICBpZiAoKnN0YXJ0IDwgbW1hcF9taW5fYWRkcikKPiA+ICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7Cj4gPiAtICAgICBpZiAoc3RhcnQgPj0gdGFza19zaXplKQo+ID4gKyAgICAgaWYg
KCpzdGFydCA+PSB0YXNrX3NpemUpCj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ID4gLSAgICAgaWYgKGxlbiA+IHRhc2tfc2l6ZSAtIHN0YXJ0KQo+ID4gKyAgICAgaWYgKGxlbiA+
IHRhc2tfc2l6ZSAtICpzdGFydCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
PiAgICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPiBAQCAtMTMyNSw3ICsxMzI3LDcgQEAgc3RhdGlj
IGludCB1c2VyZmF1bHRmZF9yZWdpc3RlcihzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgsCj4g
PiAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gICAgICAgfQo+ID4KPiA+IC0gICAgIHJldCA9
IHZhbGlkYXRlX3JhbmdlKG1tLCB1ZmZkaW9fcmVnaXN0ZXIucmFuZ2Uuc3RhcnQsCj4gPiArICAg
ICByZXQgPSB2YWxpZGF0ZV9yYW5nZShtbSwgJnVmZmRpb19yZWdpc3Rlci5yYW5nZS5zdGFydCwK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVmZmRpb19yZWdpc3Rlci5yYW5nZS5sZW4p
Owo+ID4gICAgICAgaWYgKHJldCkKPiA+ICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiBAQCAt
MTUxNCw3ICsxNTE2LDcgQEAgc3RhdGljIGludCB1c2VyZmF1bHRmZF91bnJlZ2lzdGVyKHN0cnVj
dCB1c2VyZmF1bHRmZF9jdHggKmN0eCwKPiA+ICAgICAgIGlmIChjb3B5X2Zyb21fdXNlcigmdWZm
ZGlvX3VucmVnaXN0ZXIsIGJ1Ziwgc2l6ZW9mKHVmZmRpb191bnJlZ2lzdGVyKSkpCj4gPiAgICAg
ICAgICAgICAgIGdvdG8gb3V0Owo+ID4KPiA+IC0gICAgIHJldCA9IHZhbGlkYXRlX3JhbmdlKG1t
LCB1ZmZkaW9fdW5yZWdpc3Rlci5zdGFydCwKPiA+ICsgICAgIHJldCA9IHZhbGlkYXRlX3Jhbmdl
KG1tLCAmdWZmZGlvX3VucmVnaXN0ZXIuc3RhcnQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1ZmZkaW9fdW5yZWdpc3Rlci5sZW4pOwo+ID4gICAgICAgaWYgKHJldCkKPiA+ICAgICAg
ICAgICAgICAgZ290byBvdXQ7Cj4gPiBAQCAtMTY2NSw3ICsxNjY3LDcgQEAgc3RhdGljIGludCB1
c2VyZmF1bHRmZF93YWtlKHN0cnVjdCB1c2VyZmF1bHRmZF9jdHggKmN0eCwKPiA+ICAgICAgIGlm
IChjb3B5X2Zyb21fdXNlcigmdWZmZGlvX3dha2UsIGJ1Ziwgc2l6ZW9mKHVmZmRpb193YWtlKSkp
Cj4gPiAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4KPiA+IC0gICAgIHJldCA9IHZhbGlkYXRl
X3JhbmdlKGN0eC0+bW0sIHVmZmRpb193YWtlLnN0YXJ0LCB1ZmZkaW9fd2FrZS5sZW4pOwo+ID4g
KyAgICAgcmV0ID0gdmFsaWRhdGVfcmFuZ2UoY3R4LT5tbSwgJnVmZmRpb193YWtlLnN0YXJ0LCB1
ZmZkaW9fd2FrZS5sZW4pOwo+ID4gICAgICAgaWYgKHJldCkKPiA+ICAgICAgICAgICAgICAgZ290
byBvdXQ7Cj4gPgo+ID4gQEAgLTE3MDUsNyArMTcwNyw3IEBAIHN0YXRpYyBpbnQgdXNlcmZhdWx0
ZmRfY29weShzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgsCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2l6ZW9mKHVmZmRpb19jb3B5KS1zaXplb2YoX19zNjQpKSkKPiA+ICAgICAgICAg
ICAgICAgZ290byBvdXQ7Cj4gPgo+ID4gLSAgICAgcmV0ID0gdmFsaWRhdGVfcmFuZ2UoY3R4LT5t
bSwgdWZmZGlvX2NvcHkuZHN0LCB1ZmZkaW9fY29weS5sZW4pOwo+ID4gKyAgICAgcmV0ID0gdmFs
aWRhdGVfcmFuZ2UoY3R4LT5tbSwgJnVmZmRpb19jb3B5LmRzdCwgdWZmZGlvX2NvcHkubGVuKTsK
PiA+ICAgICAgIGlmIChyZXQpCj4gPiAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gICAgICAg
LyoKPiA+IEBAIC0xNzYxLDcgKzE3NjMsNyBAQCBzdGF0aWMgaW50IHVzZXJmYXVsdGZkX3plcm9w
YWdlKHN0cnVjdCB1c2VyZmF1bHRmZF9jdHggKmN0eCwKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBzaXplb2YodWZmZGlvX3plcm9wYWdlKS1zaXplb2YoX19zNjQpKSkKPiA+ICAgICAgICAg
ICAgICAgZ290byBvdXQ7Cj4gPgo+ID4gLSAgICAgcmV0ID0gdmFsaWRhdGVfcmFuZ2UoY3R4LT5t
bSwgdWZmZGlvX3plcm9wYWdlLnJhbmdlLnN0YXJ0LAo+ID4gKyAgICAgcmV0ID0gdmFsaWRhdGVf
cmFuZ2UoY3R4LT5tbSwgJnVmZmRpb196ZXJvcGFnZS5yYW5nZS5zdGFydCwKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVmZmRpb196ZXJvcGFnZS5yYW5nZS5sZW4pOwo+ID4gICAgICAg
aWYgKHJldCkKPiA+ICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiAtLQo+ID4gMi4yMi4wLjQx
MC5nZDhmZGJlMjFiNS1nb29nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
