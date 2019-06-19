Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6B94C84E
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 09:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8567A6E54C;
	Thu, 20 Jun 2019 07:22:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7346E419
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 14:42:27 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id c14so7346102plo.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 07:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZUb5QTtqm4gVcMQkDqa/NfcfqCV/fqPlPHdvScpz0wo=;
 b=uBBWbKPCB3L4k/LzTACPdCh/5RaWRTWjLE04UNxnM/zM2dawxXpcUtToKZotSppjcJ
 a2jXszEFJTsByOT/lSQvoxyOpDKRkLdagb0dmRUwVbaodLOf0LzdW8gFSkKvnLqO0Vb+
 qwxKCeCRCCCbJaLKhTDiCOwkwBWBAIjCajyTL6P8uMSJX5hfFFMXujehju/9GvdCmJ1F
 E6DT3TuCprx6AduNi2VzosQK6DgLQc5tewhsmZNdfiNrdgItYV+bsAs4Ein01br/FmoF
 0hKgQrQZz+5vCkmxZfLJ/SrUyA+//672ZCxOxSk56aH0P2VxO7VEq8rHO4xSlLcLDLwd
 wTrQ==
X-Gm-Message-State: APjAAAV6cxW3AChF6I+EDI0kpFUpOAt8Alx3paW/oNFFyoDCS6kcraOU
 J4sz2bz3begZpgf6sM9AkGG5Iq8WfOz8u6aWLleBvSKqW7Y=
X-Google-Smtp-Source: APXvYqz/8xJBvM5YApkc8q1BMr1dT5VicIPSZVfioxxqqY6SMtW097rTx7U+hky1E4IR1FcJP1uIwN60haaDiBmSyao=
X-Received: by 2002:a17:902:4183:: with SMTP id
 f3mr3975974pld.336.1560955346243; 
 Wed, 19 Jun 2019 07:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560339705.git.andreyknvl@google.com>
 <e024234e652f23be4d76d63227de114e7def5dff.1560339705.git.andreyknvl@google.com>
 <7cd942c0-d4c1-0cf4-623a-bce6ef14d992@arm.com>
 <20190612150040.GH28951@C02TF0J2HF1T.local>
In-Reply-To: <20190612150040.GH28951@C02TF0J2HF1T.local>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Wed, 19 Jun 2019 16:42:15 +0200
Message-ID: <CAAeHK+yWdW_sa2HgD8foCuwHj97dgGd07K2b1W1-9fpLXGmphQ@mail.gmail.com>
Subject: Re: [PATCH v17 15/15] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:22:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ZUb5QTtqm4gVcMQkDqa/NfcfqCV/fqPlPHdvScpz0wo=;
 b=jbRaxdb+WWdzPQKppmuoBauA7dvRkdybKRNWtDi8BmVPL/duOwFKyfvGY1RtILXxC+
 E8fMNzdn99xzzaV1RU67k5BSaIeAySJVjGFam1tncgt0b1c3N/H+rn9Q1Ce9beAuIxY9
 4KU4S5Y6wyOdt8eRLq9iK/DasXwgpWgTB7OZoLagsJt17dKKFAk9z5/knt/SGGUXD1Pm
 OoCcVKVcumlyUAfwODg+GBNNkPYKXfWaLZhXGdXetH+hDPabh+cOTFmJx9VZ0MK9R5nx
 t58AUdQKa58pKb0SOzR1wBFV6nXGOJqmSpABaHdX/di+h0+s+ytlFiUVqPji7K9x3yTy
 3m5w==
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
Cc: Mark Rutland <Mark.Rutland@arm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <Will.Deacon@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <Vincenzo.Frascino@arm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave P Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Kevin Brodsky <Kevin.Brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>, nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <Robin.Murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgNTowMSBQTSBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4u
bWFyaW5hc0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVuIDEyLCAyMDE5IGF0IDAxOjMw
OjM2UE0gKzAxMDAsIFN6YWJvbGNzIE5hZ3kgd3JvdGU6Cj4gPiBPbiAxMi8wNi8yMDE5IDEyOjQz
LCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ICsrKyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L3RhZ3NfbGliLmMKPiA+ID4gQEAgLTAsMCAr
MSw2MiBAQAo+ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+ID4g
Kwo+ID4gPiArI2luY2x1ZGUgPHN0ZGxpYi5oPgo+ID4gPiArI2luY2x1ZGUgPHN5cy9wcmN0bC5o
Pgo+ID4gPiArCj4gPiA+ICsjZGVmaW5lIFRBR19TSElGVCAgKDU2KQo+ID4gPiArI2RlZmluZSBU
QUdfTUFTSyAgICgweGZmVUwgPDwgVEFHX1NISUZUKQo+ID4gPiArCj4gPiA+ICsjZGVmaW5lIFBS
X1NFVF9UQUdHRURfQUREUl9DVFJMICAgIDU1Cj4gPiA+ICsjZGVmaW5lIFBSX0dFVF9UQUdHRURf
QUREUl9DVFJMICAgIDU2Cj4gPiA+ICsjZGVmaW5lIFBSX1RBR0dFRF9BRERSX0VOQUJMRSAgICAg
ICgxVUwgPDwgMCkKPiA+ID4gKwo+ID4gPiArdm9pZCAqX19saWJjX21hbGxvYyhzaXplX3Qgc2l6
ZSk7Cj4gPiA+ICt2b2lkIF9fbGliY19mcmVlKHZvaWQgKnB0cik7Cj4gPiA+ICt2b2lkICpfX2xp
YmNfcmVhbGxvYyh2b2lkICpwdHIsIHNpemVfdCBzaXplKTsKPiA+ID4gK3ZvaWQgKl9fbGliY19j
YWxsb2Moc2l6ZV90IG5tZW1iLCBzaXplX3Qgc2l6ZSk7Cj4gPgo+ID4gdGhpcyBkb2VzIG5vdCB3
b3JrIG9uIGF0IGxlYXN0IG11c2wuCj4gPgo+ID4gdGhlIG1vc3Qgcm9idXN0IHNvbHV0aW9uIHdv
dWxkIGJlIHRvIGltcGxlbWVudAo+ID4gdGhlIG1hbGxvYyBhcGlzIHdpdGggbW1hcC9tdW5tYXAv
bXJlbWFwLCBpZiB0aGF0J3MKPiA+IHRvbyBjdW1iZXJzb21lIHRoZW4gdXNlIGRsc3ltIFJUTERf
TkVYVCAoYWx0aG91Z2gKPiA+IHRoYXQgaGFzIHRoZSBzbGlnaHQgd2FydCB0aGF0IGluIGdsaWJj
IGl0IG1heSBjYWxsCj4gPiBjYWxsb2Mgc28gd3JhcHBpbmcgY2FsbG9jIHRoYXQgd2F5IGlzIHRy
aWNreSkuCj4gPgo+ID4gaW4gc2ltcGxlIGxpbnV4IHRlc3RzIGknZCBqdXN0IHVzZSBzdGF0aWMg
b3IKPiA+IHN0YWNrIGFsbG9jYXRpb25zIG9yIG1tYXAuCj4gPgo+ID4gaWYgYSBnZW5lcmljIHBy
ZWxvYWRhYmxlIGxpYiBzb2x1dGlvbiBpcyBuZWVkZWQKPiA+IHRoZW4gZG8gaXQgcHJvcGVybHkg
d2l0aCBwdGhyZWFkX29uY2UgdG8gYXZvaWQKPiA+IHJhY2VzIGV0Yy4KPgo+IFRoYW5rcyBmb3Ig
dGhlIGZlZWRiYWNrIFN6YWJvbGNzLiBJIGd1ZXNzIHdlIGNhbiBnbyBiYWNrIHRvIHRoZSBpbml0
aWFsCj4gc2ltcGxlIHRlc3QgdGhhdCBBbmRyZXkgaGFkIGFuZCBkcm9wIHRoZSB3aG9sZSBMRF9Q
UkVMT0FEIGhhY2sgKEknbGwKPiBqdXN0IHVzZSBpdCBmb3IgbXkgaW50ZXJuYWwgdGVzdGluZyku
CgpPSywgd2lsbCBkbyBpbiB2MTguCgo+Cj4gQlRXLCB3aGVuIHlvdSBnZXQgc29tZSB0aW1lLCBw
bGVhc2UgcmV2aWV3IFZpbmNlbnpvJ3MgQUJJIGRvY3VtZW50YXRpb24KPiBwYXRjaGVzIGZyb20g
YSB1c2VyL2xpYmMgcGVyc3BlY3RpdmUuIE9uY2UgYWdyZWVkLCB0aGV5IHNob3VsZCBiZWNvbWUK
PiBwYXJ0IG9mIHRoaXMgc2VyaWVzLgo+Cj4gLS0KPiBDYXRhbGluCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
