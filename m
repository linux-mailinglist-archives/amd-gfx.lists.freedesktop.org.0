Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C80598D73B
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 17:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6858E6E673;
	Wed, 14 Aug 2019 15:30:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A79C6E504
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 14:48:39 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id e12so38664815otp.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 07:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TuidyYaeRyKNuzkufRgN6Ec9LRr2Ifgbce3UwZKDqAk=;
 b=dSwIKwbGWZF1i2X28KuljOUD66lfr93uDVAuBHF8iwlK/+U04qgx6+BqV4EDlDCZOb
 iqKRt1Y/0UU5yYhvMIQDz6ATudzl6nK8HaM3L5GB/WIVep5m8OAFUNVwndDGA6aqj3CE
 BG+877r2TurEX7Gqi70n7p8i4LbjpaxmPnzW5jukWunyfPjG4qOtzut99on99ydgIbKo
 eAV8wvRCZo9RNgDuX3PJMwWvtRehYL8xVpGqK3dKeh+CUrVW219QfPa5uoOpnidQwQUu
 jeWuBtl/GUxxdW6kG8QOaoFx/1afjR+HecBXUngOTuwucUZW5xeYd7jfk+iFlVuCyDX3
 fFsg==
X-Gm-Message-State: APjAAAUl0PxtXLBj4fZ9iZk+qztBM47nyt5AdVcb1Fpe2TeMOV7zCAIg
 PO49tY8K9PlguA/MFNdjkQ4yOULvaaScaSBbVE52yA==
X-Google-Smtp-Source: APXvYqz7zm4exw86gTxj/ItuLHdqDfdPZkzMbuPMtbbm6xwrB+umcFhlOUSiQC4HRsH79R5rtenZdkZ3lrgt5XcFI70=
X-Received: by 2002:a9d:6b96:: with SMTP id b22mr2732383otq.363.1565794118373; 
 Wed, 14 Aug 2019 07:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-5-hch@lst.de>
 <20190807174548.GJ1571@mellanox.com>
 <CAPcyv4hPCuHBLhSJgZZEh0CbuuJNPLFDA3f-79FX5uVOO0yubA@mail.gmail.com>
 <20190808065933.GA29382@lst.de>
 <CAPcyv4hMUzw8vyXFRPe2pdwef0npbMm9tx9wiZ9MWkHGhH1V6w@mail.gmail.com>
 <20190814073854.GA27249@lst.de> <20190814132746.GE13756@mellanox.com>
In-Reply-To: <20190814132746.GE13756@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 14 Aug 2019 07:48:28 -0700
Message-ID: <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Approved-At: Wed, 14 Aug 2019 15:30:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TuidyYaeRyKNuzkufRgN6Ec9LRr2Ifgbce3UwZKDqAk=;
 b=VGmsuSutDmh/CjlBsd4sxqgbi8um+dCHzh+K0g76f30mKTKa4vnjEUi5IghOvDT2TU
 IiuduD1hp/FbpMVaMr/e7wBsaqMWdJ6XHtQ/1mBsBItSP4Wnk6xfU27TabVrZ7CxNxNQ
 xk36x4tWlqqM3zgQ+imkzsVY04ipeNiKK+QA1YnFVauQbb2Je88bjQTJ7UYiJXdobeSQ
 8yXovyKKvS5GfjCCiA8ng2LVaXxNaFUycGFOD1MJp5B3wtPnD6SMS1YSM8AN/j0ewy4K
 946ksv8AZDHbxIlpfzizsK/Ykelqs/5V6AZKhURom457TIKDaqNjmkxGJQw/75l6BLCF
 rGkA==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgNjoyOCBBTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxs
YW5veC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDk6Mzg6NTRBTSAr
MDIwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBPbiBUdWUsIEF1ZyAxMywgMjAxOSBh
dCAwNjozNjozM1BNIC0wNzAwLCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4gPiA+IFNlY3Rpb24gYWxp
Z25tZW50IGNvbnN0cmFpbnRzIHNvbWV3aGF0IHNhdmUgdXMgaGVyZS4gVGhlIG9ubHkgZXhhbXBs
ZQo+ID4gPiBJIGNhbiB0aGluayBvZiBhIFBNRCBub3QgY29udGFpbmluZyBhIHVuaWZvcm0gcGdt
YXAgYXNzb2NpYXRpb24gZm9yCj4gPiA+IGVhY2ggcHRlIGlzIHRoZSBjYXNlIHdoZW4gdGhlIHBn
bWFwIG92ZXJsYXBzIG5vcm1hbCBkcmFtLCBpLmUuIHNoYXJlcwo+ID4gPiB0aGUgc2FtZSAnc3Ry
dWN0IG1lbW9yeV9zZWN0aW9uJyBmb3IgYSBnaXZlbiBzcGFuLiBPdGhlcndpc2UsIGRpc3RpbmN0
Cj4gPiA+IHBnbWFwcyBhcnJhbmdlIHRvIG1hbmFnZSB0aGVpciBvd24gZXhjbHVzaXZlIHNlY3Rp
b25zIChhbmQgbm93Cj4gPiA+IHN1YnNlY3Rpb25zIGFzIG9mIHY1LjMpLiBPdGhlcndpc2UgdGhl
IGltcGxlbWVudGF0aW9uIGNvdWxkIG5vdAo+ID4gPiBndWFyYW50ZWUgZGlmZmVyZW50IG1hcHBp
bmcgbGlmZXRpbWVzLgo+ID4gPgo+ID4gPiBUaGF0IHNhaWQsIHRoaXMgc2VlbXMgdG8gd2FudCBh
IGJldHRlciBtZWNoYW5pc20gdG8gZGV0ZXJtaW5lICJwZm4gaXMKPiA+ID4gWk9ORV9ERVZJQ0Ui
Lgo+ID4KPiA+IFNvIEkgZ3Vlc3MgdGhpcyBwYXRjaCBpcyBmaW5lIGZvciBub3csIGFuZCBvbmNl
IHlvdSBwcm92aWRlIGEgYmV0dGVyCj4gPiBtZWNoYW5pc20gd2UgY2FuIHN3aXRjaCBvdmVyIHRv
IGl0Pwo+Cj4gV2hhdCBhYm91dCB0aGUgdmVyc2lvbiBJIHNlbnQgdG8ganVzdCBnZXQgcmlkIG9m
IGFsbCB0aGUgc3RyYW5nZQo+IHB1dF9kZXZfcGFnZW1hcHMgd2hpbGUgc2Nhbm5pbmc/IE9kZHMg
YXJlIGdvb2Qgd2Ugd2lsbCB3b3JrIHdpdGggb25seQo+IGEgc2luZ2xlIHBhZ2VtYXAsIHNvIGl0
IG1ha2VzIHNvbWUgc2Vuc2UgdG8gY2FjaGUgaXQgb25jZSB3ZSBmaW5kIGl0PwoKWWVzLCBpZiB0
aGUgc2NhbiBpcyBvdmVyIGEgc2luZ2xlIHBtZCB0aGVuIGNhY2hpbmcgaXQgbWFrZXMgc2Vuc2Uu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
