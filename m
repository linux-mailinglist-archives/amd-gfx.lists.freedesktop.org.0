Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88014257C6
	for <lists+amd-gfx@lfdr.de>; Tue, 21 May 2019 20:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303038958E;
	Tue, 21 May 2019 18:49:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E9E890B2
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 May 2019 18:48:59 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id z128so11735390qkb.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 May 2019 11:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Brh6Wum1Zthj/uQ2mtyHFIq9uQlvrAXKSZbEsVapKL8=;
 b=UKpuAHblyZpsKOIN7hGj+2zU4sVqIVsbUIblaF3Zipe4otXz0cV6TqKokACev/7Fng
 M+t7LodXo1PD8DF3aoCc7Sm7rwlNmXJNMstn39GTT9l2Se4cjyFD7UZhMiJLC8xmUf7l
 FYRbIB4gPaw6bmIWj08lcJHT2a6fKoGSLSdkqZ/qcY+jgCOaetNjw+zQWVVBVACbZ/t5
 vpFZjhWBoTQKPcplHykA9M/jnZ557/Nt6k9bdoMD97AF7xmrHlWiiVrpVp2Z6BKnYmvp
 idIAvDyjL7Kx4KExltXdSrlfYygpZnItj/HL1iCuu+VA0hWn++BKUVuXR/wy6IC0cnqh
 VOCA==
X-Gm-Message-State: APjAAAXOP0FBaYKpflNIIvd/sWOzaEvnUrYAjxQYaFvNNYS9eR2QvkG5
 DIJl4wJJ3DXG+CYlQnyzoscyrw==
X-Google-Smtp-Source: APXvYqwU77tWKnZY68/uvl8nI3fxF+k0K8AI67X6RVtQAbCKMK/pPRLs+1/gDbqNIuNCiuScF9EnOQ==
X-Received: by 2002:a37:358:: with SMTP id 85mr63206066qkd.174.1558464538599; 
 Tue, 21 May 2019 11:48:58 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-49-251.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.49.251])
 by smtp.gmail.com with ESMTPSA id u2sm5545370qtq.45.2019.05.21.11.48.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 11:48:57 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hT9om-0004QR-Qs; Tue, 21 May 2019 15:48:56 -0300
Date: Tue, 21 May 2019 15:48:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
Message-ID: <20190521184856.GC2922@ziepe.ca>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190517144931.GA56186@arrakis.emea.arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 21 May 2019 18:49:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Brh6Wum1Zthj/uQ2mtyHFIq9uQlvrAXKSZbEsVapKL8=;
 b=JYscqSP1HPPRVqGuMd5owD3l/IDlGmL6FFL67m798Jm2AP4qGcOTqtawfRNo+5kAFu
 iEJ0vUz9qOZ+rvajt/fb76zKILX2m7sPHzCjQLxU/xpu8s+X3lkRy9CgqtNpDaf0XFJu
 m/SIilww4DfdKs62gi8wE4MGevsPrJgDS2TyvhL/7eUtavobHZ7DqCVwKBcDulDJUjVu
 MVt0CUr2fUDTtnd4Vvag66g4rnBT/cZ1xH3t4yZwYbfafoegD76V6HRafoLD0R1dZ62Z
 EbRvObIPEul9wb7eEhcBGsIGomq6YRkOd3NfdawsXW6Hn11cNpJ1sY5CjCpDM4tjfGZL
 aezw==
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDM6NDk6MzFQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgoKPiBUaGUgdGFnZ2VkIHBvaW50ZXJzICh3aGV0aGVyIGh3YXNhbiBvciBNVEUpIHNo
b3VsZCBpZGVhbGx5IGJlIGEKPiB0cmFuc3BhcmVudCBmZWF0dXJlIGZvciB0aGUgYXBwbGljYXRp
b24gd3JpdGVyIGJ1dCBJIGRvbid0IHRoaW5rIHdlIGNhbgo+IHNvbHZlIGl0IGVudGlyZWx5IGFu
ZCBtYWtlIGl0IHNlYW1sZXNzIGZvciB0aGUgbXVsdGl0dWRlIG9mIGlvY3RscygpLgo+IEknZCBz
YXkgeW91IG9ubHkgb3B0IGluIHRvIHN1Y2ggZmVhdHVyZSBpZiB5b3Uga25vdyB3aGF0IHlvdSBh
cmUgZG9pbmcKPiBhbmQgdGhlIHVzZXIgY29kZSB0YWtlcyBjYXJlIG9mIHNwZWNpZmljIGNhc2Vz
IGxpa2UgaW9jdGwoKSwgaGVuY2UgdGhlCj4gcHJjdGwoKSBwcm9wb3NhbCBldmVuIGZvciB0aGUg
aHdhc2FuLgoKSSdtIG5vdCBzdXJlIHN1Y2ggYSBkaXJlIHZpZXcgaXMgd2FycmVudGVkLi4gCgpU
aGUgaW9jdGwgc2l0dWF0aW9uIGlzIG5vdCBzbyBiYWQsIG90aGVyIHRoYW4gYSBmZXcgc3BlY2lh
bCBjYXNlcywKbW9zdCBkcml2ZXJzIGp1c3QgdGFrZSBhICd2b2lkIF9fdXNlciAqJyBhbmQgcGFz
cyBpdCBhcyBhbiBhcmd1bWVudCB0bwpzb21lIGZ1bmN0aW9uIHRoYXQgYWNjZXB0cyBhICd2b2lk
IF9fdXNlciAqJy4gc3BhcnNlIGV0IGFsIHZlcmlmeQp0aGlzLiAKCkFzIGxvbmcgYXMgdGhlIGNv
cmUgZnVuY3Rpb25zIGRvIHRoZSByaWdodCB0aGluZyB0aGUgZHJpdmVycyB3aWxsIGJlCk9LLgoK
VGhlIG9ubHkgcGxhY2UgdGhpbmdzIGdldCBkaWN5IGlzIGlmIHNvbWVvbmUgY2FzdHMgdG8gdW5z
aWduZWQgbG9uZwooaWUgZm9yIHZtYSB3b3JrKSBidXQgSSB0aGluayB0aGF0IHJlZmxlY3RzIHRo
YXQgb3VyIGRyaXZlciBmYWNpbmcKQVBJcyBmb3IgVk1BcyBhcmUgY29tcGF0aWJsZSB3aXRoIHN0
YXRpYyBhbmFseXNpcyAoaWUgSSBoYXZlIG5vCmVhcnRobHkgaWRlYSB3aHkgZ2V0X3VzZXJfcGFn
ZXMoKSBhY2NlcHRzIGFuIHVuc2lnbmVkIGxvbmcpLCBub3QgdGhhdAp0aGlzIGlzIHRvbyBoYXJk
LgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
