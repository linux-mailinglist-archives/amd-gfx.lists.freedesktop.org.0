Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE5A2DE70
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 15:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D3A6E31E;
	Wed, 29 May 2019 13:37:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCF86E08A;
 Wed, 29 May 2019 06:11:33 +0000 (UTC)
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hVro6-0006Yh-Is; Wed, 29 May 2019 06:11:26 +0000
Date: Tue, 28 May 2019 23:11:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190529061126.GA18124@infradead.org>
References: <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp>
 <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
 <20190523201105.oifkksus4rzcwqt4@mbp>
 <ffe58af3-7c70-d559-69f6-1f6ebcb0fec6@oracle.com>
 <20190524101139.36yre4af22bkvatx@mbp>
 <c6dd53d8-142b-3d8d-6a40-d21c5ee9d272@oracle.com>
 <CAAeHK+yAUsZWhp6xPAbWewX5Nbw+-G3svUyPmhXu5MVeEDKYvA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+yAUsZWhp6xPAbWewX5Nbw+-G3svUyPmhXu5MVeEDKYvA@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 29 May 2019 13:37:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ki8wlzJaAXUMUjbjK207hScTMszow2OB9kp3Ebyx2W4=; b=C63n5tH5sy21OVy69pE2Oeedi
 R/8G/O4R+cqkOb+iay2A6/Ut98QvmOoVxDkFq9W2+7U/LqR+H8f2OYu4N8PPxCiXmTn6+ZCacke9R
 NiVaBNHylJKbX5saC2PVaMZWgJI/vqUasbLHzdYAaf6JMJZnN5dnuUb+xuFqzNQ1JfxCcFuQJ4xK+
 6qWDzjNi2j3o36d3TPB8w5XNqN0HcN+Qs09ffRNSsIKDnPfv3T/Ev6qXrq/Wr6gPHomkX4l/KvNpH
 N2TnBmCl3vuVelWduaIB1cfkd9FE3VcX3LaRbJyskNDE+jHFkxAKB3R4p6SImibWTKLIlWDTUm7UG
 kjPLjC7pg==;
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
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgenii Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Elliott Hughes <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDQ6MTQ6NDVQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGFua3MgZm9yIGEgbG90IG9mIHZhbHVhYmxlIGlucHV0ISBJJ3ZlIHJlYWQg
dGhyb3VnaCBhbGwgdGhlIHJlcGxpZXMKPiBhbmQgZ290IHNvbWV3aGF0IGxvc3QuIFdoYXQgYXJl
IHRoZSBjaGFuZ2VzIEkgbmVlZCB0byBkbyB0byB0aGlzCj4gc2VyaWVzPwo+IAo+IDEuIFNob3Vs
ZCBJIG1vdmUgdW50YWdnaW5nIGZvciBtZW1vcnkgc3lzY2FsbHMgYmFjayB0byB0aGUgZ2VuZXJp
Ywo+IGNvZGUgc28gb3RoZXIgYXJjaGVzIHdvdWxkIG1ha2UgdXNlIG9mIGl0IGFzIHdlbGwsIG9y
IHNob3VsZCBJIGtlZXAKPiB0aGUgYXJtNjQgc3BlY2lmaWMgbWVtb3J5IHN5c2NhbGxzIHdyYXBw
ZXJzIGFuZCBhZGRyZXNzIHRoZSBjb21tZW50cwo+IG9uIHRoYXQgcGF0Y2g/CgpJdCBhYnNvbHV0
ZWx5IG5lZWRzIHRvIG1vdmUgdG8gY29tbW9uIGNvZGUuICBIYXZpbmcgYXJjaCBjb2RlIGxlYWRz
CnRvIHBvaW50bGVzcyAob2Z0ZW4gdW5pbnRlbnRpb25hbCkgc2VtYW50aWMgZGlmZmVyZW5jZSBi
ZXR3ZWVuCmFyY2hpdGVjdHVyZXMsIGFuZCBsb3RzIG9mIGJvaWxlcnBsYXRlIGNvZGUuCgpCdHcs
IGNhbiBhbnlvbmUgb2YgdGhlIGFybSBjcm93ZCBvciBLaGFsaWQgY29tbWVudCBvbiB0aGUgbGlu
dXgtbW0KdGhyZWFkIG9uIGdlbmVyaWMgZ3VwIHdoZXJlIEknbSBkZWFsaW5nIHdpdGggdGhlIHBy
ZS1leGlzdGluZyBBREkKY2FzZSBvZiBwb2ludGVyIHVudGFnZ2luZz8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
