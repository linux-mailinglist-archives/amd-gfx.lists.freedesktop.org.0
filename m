Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DA821B516
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2020 14:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919876EC33;
	Fri, 10 Jul 2020 12:30:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF996EC32;
 Fri, 10 Jul 2020 12:30:38 +0000 (UTC)
IronPort-SDR: AwhTF30/HBerwOQaoO/Naz5QcBkI0K6HEl3D+HO65chYTc1AmVBCwRi9U1aB3IsJOcxnzQ3mq5
 mtXK2vKDkwFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="149656878"
X-IronPort-AV: E=Sophos;i="5.75,335,1589266800"; d="scan'208";a="149656878"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2020 05:30:37 -0700
IronPort-SDR: cftD1yfh/1nQA1PDZMmZn1DC4qquNxaY/8BnGAe2+5lxp8nPb91koWGednsCdzSMuEPYsc/Mkl
 0PHDoh3FWFCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,335,1589266800"; d="scan'208";a="484163756"
Received: from dedwards-mobl.ger.corp.intel.com (HELO [10.249.32.130])
 ([10.249.32.130])
 by fmsmga006.fm.intel.com with ESMTP; 10 Jul 2020 05:30:33 -0700
Subject: Re: [PATCH 1/2] dma-buf.rst: Document why indefinite fences are a bad
 idea
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <42dafd6d-cd8e-2de9-4d34-47aff76f5640@linux.intel.com>
Date: Fri, 10 Jul 2020 14:30:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709123339.547390-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Daniel Stone <daniels@collabora.com>, linux-rdma@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linaro-mm-sig@lists.linaro.org, Steve Pronovost <spronovo@microsoft.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Jesse Natalie <jenatali@microsoft.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>, linux-media@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T3AgMDktMDctMjAyMCBvbSAxNDozMyBzY2hyZWVmIERhbmllbCBWZXR0ZXI6Cj4gQ29tZXMgdXAg
ZXZlcnkgZmV3IHllYXJzLCBnZXRzIHNvbWV3aGF0IHRlZGlvdXMgdG8gZGlzY3VzcywgbGV0J3MK
PiB3cml0ZSB0aGlzIGRvd24gb25jZSBhbmQgZm9yIGFsbC4KPgo+IFdoYXQgSSdtIG5vdCBzdXJl
IGFib3V0IGlzIHdoZXRoZXIgdGhlIHRleHQgc2hvdWxkIGJlIG1vcmUgZXhwbGljaXQgaW4KPiBm
bGF0IG91dCBtYW5kYXRpbmcgdGhlIGFtZGtmZCBldmljdGlvbiBmZW5jZXMgZm9yIGxvbmcgcnVu
bmluZyBjb21wdXRlCj4gd29ya2xvYWRzIG9yIHdvcmtsb2FkcyB3aGVyZSB1c2Vyc3BhY2UgZmVu
Y2luZyBpcyBhbGxvd2VkLgo+Cj4gdjI6IE5vdyB3aXRoIGRvdCBncmFwaCEKPgo+IHYzOiBUeXBv
IChEYXZlIEFpcmxpZSkKCkZvciBmaXJzdCA1IHBhdGNoZXMsIGFuZCBwYXRjaCAxNiwgMTc6CgpS
ZXZpZXdlZC1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4Lmlu
dGVsLmNvbT4KCj4gQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KPiBBY2tlZC1ieTogRGFuaWVsIFN0b25lIDxkYW5pZWxzQGNvbGxhYm9yYS5jb20+
Cj4gQ2M6IEplc3NlIE5hdGFsaWUgPGplbmF0YWxpQG1pY3Jvc29mdC5jb20+Cj4gQ2M6IFN0ZXZl
IFByb25vdm9zdCA8c3Byb25vdm9AbWljcm9zb2Z0LmNvbT4KPiBDYzogSmFzb24gRWtzdHJhbmQg
PGphc29uQGpsZWtzdHJhbmQubmV0Pgo+IENjOiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxp
bmdAYW1kLmNvbT4KPiBDYzogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBpbnRlbC5jb20+
Cj4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPgo+IENj
OiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5s
aW5hcm8ub3JnCj4gQ2M6IGxpbnV4LXJkbWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAtLS0KPiAgRG9j
dW1lbnRhdGlvbi9kcml2ZXItYXBpL2RtYS1idWYucnN0IHwgNzAgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdCBiL0RvY3VtZW50YXRp
b24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdAo+IGluZGV4IGY4ZjZkZWNkZTM1OS4uMTAwYmZkMjI3
MjY1IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9kbWEtYnVmLnJzdAo+IEBAIC0xNzgsMyAr
MTc4LDczIEBAIERNQSBGZW5jZSB1QUJJL1N5bmMgRmlsZQo+ICAuLiBrZXJuZWwtZG9jOjogaW5j
bHVkZS9saW51eC9zeW5jX2ZpbGUuaAo+ICAgICA6aW50ZXJuYWw6Cj4gIAo+ICtJbmRlZmluaXRl
IERNQSBGZW5jZXMKPiArfn5+fn5+fn5+fn5+fn5+fn5+fn4KPiArCj4gK0F0IHZhcmlvdXMgdGlt
ZXMgJmRtYV9mZW5jZSB3aXRoIGFuIGluZGVmaW5pdGUgdGltZSB1bnRpbCBkbWFfZmVuY2Vfd2Fp
dCgpCj4gK2ZpbmlzaGVzIGhhdmUgYmVlbiBwcm9wb3NlZC4gRXhhbXBsZXMgaW5jbHVkZToKPiAr
Cj4gKyogRnV0dXJlIGZlbmNlcywgdXNlZCBpbiBIV0MxIHRvIHNpZ25hbCB3aGVuIGEgYnVmZmVy
IGlzbid0IHVzZWQgYnkgdGhlIGRpc3BsYXkKPiArICBhbnkgbG9uZ2VyLCBhbmQgY3JlYXRlZCB3
aXRoIHRoZSBzY3JlZW4gdXBkYXRlIHRoYXQgbWFrZXMgdGhlIGJ1ZmZlciB2aXNpYmxlLgo+ICsg
IFRoZSB0aW1lIHRoaXMgZmVuY2UgY29tcGxldGVzIGlzIGVudGlyZWx5IHVuZGVyIHVzZXJzcGFj
ZSdzIGNvbnRyb2wuCj4gKwo+ICsqIFByb3h5IGZlbmNlcywgcHJvcG9zZWQgdG8gaGFuZGxlICZk
cm1fc3luY29iaiBmb3Igd2hpY2ggdGhlIGZlbmNlIGhhcyBub3QgeWV0Cj4gKyAgYmVlbiBzZXQu
IFVzZWQgdG8gYXN5bmNocm9ub3VzbHkgZGVsYXkgY29tbWFuZCBzdWJtaXNzaW9uLgo+ICsKPiAr
KiBVc2Vyc3BhY2UgZmVuY2VzIG9yIGdwdSBmdXRleGVzLCBmaW5lLWdyYWluZWQgbG9ja2luZyB3
aXRoaW4gYSBjb21tYW5kIGJ1ZmZlcgo+ICsgIHRoYXQgdXNlcnNwYWNlIHVzZXMgZm9yIHN5bmNo
cm9uaXphdGlvbiBhY3Jvc3MgZW5naW5lcyBvciB3aXRoIHRoZSBDUFUsIHdoaWNoCj4gKyAgYXJl
IHRoZW4gaW1wb3J0ZWQgYXMgYSBETUEgZmVuY2UgZm9yIGludGVncmF0aW9uIGludG8gZXhpc3Rp
bmcgd2luc3lzCj4gKyAgcHJvdG9jb2xzLgo+ICsKPiArKiBMb25nLXJ1bm5pbmcgY29tcHV0ZSBj
b21tYW5kIGJ1ZmZlcnMsIHdoaWxlIHN0aWxsIHVzaW5nIHRyYWRpdGlvbmFsIGVuZCBvZgo+ICsg
IGJhdGNoIERNQSBmZW5jZXMgZm9yIG1lbW9yeSBtYW5hZ2VtZW50IGluc3RlYWQgb2YgY29udGV4
dCBwcmVlbXB0aW9uIERNQQo+ICsgIGZlbmNlcyB3aGljaCBnZXQgcmVhdHRhY2hlZCB3aGVuIHRo
ZSBjb21wdXRlIGpvYiBpcyByZXNjaGVkdWxlZC4KPiArCj4gK0NvbW1vbiB0byBhbGwgdGhlc2Ug
c2NoZW1lcyBpcyB0aGF0IHVzZXJzcGFjZSBjb250cm9scyB0aGUgZGVwZW5kZW5jaWVzIG9mIHRo
ZXNlCj4gK2ZlbmNlcyBhbmQgY29udHJvbHMgd2hlbiB0aGV5IGZpcmUuIE1peGluZyBpbmRlZmlu
aXRlIGZlbmNlcyB3aXRoIG5vcm1hbAo+ICtpbi1rZXJuZWwgRE1BIGZlbmNlcyBkb2VzIG5vdCB3
b3JrLCBldmVuIHdoZW4gYSBmYWxsYmFjayB0aW1lb3V0IGlzIGluY2x1ZGVkIHRvCj4gK3Byb3Rl
Y3QgYWdhaW5zdCBtYWxpY2lvdXMgdXNlcnNwYWNlOgo+ICsKPiArKiBPbmx5IHRoZSBrZXJuZWwg
a25vd3MgYWJvdXQgYWxsIERNQSBmZW5jZSBkZXBlbmRlbmNpZXMsIHVzZXJzcGFjZSBpcyBub3Qg
YXdhcmUKPiArICBvZiBkZXBlbmRlbmNpZXMgaW5qZWN0ZWQgZHVlIHRvIG1lbW9yeSBtYW5hZ2Vt
ZW50IG9yIHNjaGVkdWxlciBkZWNpc2lvbnMuCj4gKwo+ICsqIE9ubHkgdXNlcnNwYWNlIGtub3dz
IGFib3V0IGFsbCBkZXBlbmRlbmNpZXMgaW4gaW5kZWZpbml0ZSBmZW5jZXMgYW5kIHdoZW4KPiAr
ICBleGFjdGx5IHRoZXkgd2lsbCBjb21wbGV0ZSwgdGhlIGtlcm5lbCBoYXMgbm8gdmlzaWJpbGl0
eS4KPiArCj4gK0Z1cnRoZXJtb3JlIHRoZSBrZXJuZWwgaGFzIHRvIGJlIGFibGUgdG8gaG9sZCB1
cCB1c2Vyc3BhY2UgY29tbWFuZCBzdWJtaXNzaW9uCj4gK2ZvciBtZW1vcnkgbWFuYWdlbWVudCBu
ZWVkcywgd2hpY2ggbWVhbnMgd2UgbXVzdCBzdXBwb3J0IGluZGVmaW5pdGUgZmVuY2VzIGJlaW5n
Cj4gK2RlcGVuZGVudCB1cG9uIERNQSBmZW5jZXMuIElmIHRoZSBrZXJuZWwgYWxzbyBzdXBwb3J0
IGluZGVmaW5pdGUgZmVuY2VzIGluIHRoZQo+ICtrZXJuZWwgbGlrZSBhIERNQSBmZW5jZSwgbGlr
ZSBhbnkgb2YgdGhlIGFib3ZlIHByb3Bvc2FsIHdvdWxkLCB0aGVyZSBpcyB0aGUKPiArcG90ZW50
aWFsIGZvciBkZWFkbG9ja3MuCj4gKwo+ICsuLiBrZXJuZWwtcmVuZGVyOjogRE9UCj4gKyAgIDph
bHQ6IEluZGVmaW5pdGUgRmVuY2luZyBEZXBlbmRlbmN5IEN5Y2xlCj4gKyAgIDpjYXB0aW9uOiBJ
bmRlZmluaXRlIEZlbmNpbmcgRGVwZW5kZW5jeSBDeWNsZQo+ICsKPiArICAgZGlncmFwaCAiRmVu
Y2luZyBDeWNsZSIgewo+ICsgICAgICBub2RlIFtzaGFwZT1ib3ggYmdjb2xvcj1ncmV5IHN0eWxl
PWZpbGxlZF0KPiArICAgICAga2VybmVsIFtsYWJlbD0iS2VybmVsIERNQSBGZW5jZXMiXQo+ICsg
ICAgICB1c2Vyc3BhY2UgW2xhYmVsPSJ1c2Vyc3BhY2UgY29udHJvbGxlZCBmZW5jZXMiXQo+ICsg
ICAgICBrZXJuZWwgLT4gdXNlcnNwYWNlIFtsYWJlbD0ibWVtb3J5IG1hbmFnZW1lbnQiXQo+ICsg
ICAgICB1c2Vyc3BhY2UgLT4ga2VybmVsIFtsYWJlbD0iRnV0dXJlIGZlbmNlLCBmZW5jZSBwcm94
eSwgLi4uIl0KPiArCj4gKyAgICAgIHsgcmFuaz1zYW1lOyBrZXJuZWwgdXNlcnNwYWNlIH0KPiAr
ICAgfQo+ICsKPiArVGhpcyBtZWFucyB0aGF0IHRoZSBrZXJuZWwgbWlnaHQgYWNjaWRlbnRhbGx5
IGNyZWF0ZSBkZWFkbG9ja3MKPiArdGhyb3VnaCBtZW1vcnkgbWFuYWdlbWVudCBkZXBlbmRlbmNp
ZXMgd2hpY2ggdXNlcnNwYWNlIGlzIHVuYXdhcmUgb2YsIHdoaWNoCj4gK3JhbmRvbWx5IGhhbmdz
IHdvcmtsb2FkcyB1bnRpbCB0aGUgdGltZW91dCBraWNrcyBpbi4gV29ya2xvYWRzLCB3aGljaCBm
cm9tCj4gK3VzZXJzcGFjZSdzIHBlcnNwZWN0aXZlLCBkbyBub3QgY29udGFpbiBhIGRlYWRsb2Nr
LiAgSW4gc3VjaCBhIG1peGVkIGZlbmNpbmcKPiArYXJjaGl0ZWN0dXJlIHRoZXJlIGlzIG5vIHNp
bmdsZSBlbnRpdHkgd2l0aCBrbm93bGVkZ2Ugb2YgYWxsIGRlcGVuZGVuY2llcy4KPiArVGhlZm9y
ZSBwcmV2ZW50aW5nIHN1Y2ggZGVhZGxvY2tzIGZyb20gd2l0aGluIHRoZSBrZXJuZWwgaXMgbm90
IHBvc3NpYmxlLgo+ICsKPiArVGhlIG9ubHkgc29sdXRpb24gdG8gYXZvaWQgZGVwZW5kZW5jaWVz
IGxvb3BzIGlzIGJ5IG5vdCBhbGxvd2luZyBpbmRlZmluaXRlCj4gK2ZlbmNlcyBpbiB0aGUga2Vy
bmVsLiBUaGlzIG1lYW5zOgo+ICsKPiArKiBObyBmdXR1cmUgZmVuY2VzLCBwcm94eSBmZW5jZXMg
b3IgdXNlcnNwYWNlIGZlbmNlcyBpbXBvcnRlZCBhcyBETUEgZmVuY2VzLAo+ICsgIHdpdGggb3Ig
d2l0aG91dCBhIHRpbWVvdXQuCj4gKwo+ICsqIE5vIERNQSBmZW5jZXMgdGhhdCBzaWduYWwgZW5k
IG9mIGJhdGNoYnVmZmVyIGZvciBjb21tYW5kIHN1Ym1pc3Npb24gd2hlcmUKPiArICB1c2Vyc3Bh
Y2UgaXMgYWxsb3dlZCB0byB1c2UgdXNlcnNwYWNlIGZlbmNpbmcgb3IgbG9uZyBydW5uaW5nIGNv
bXB1dGUKPiArICB3b3JrbG9hZHMuIFRoaXMgYWxzbyBtZWFucyBubyBpbXBsaWNpdCBmZW5jaW5n
IGZvciBzaGFyZWQgYnVmZmVycyBpbiB0aGVzZQo+ICsgIGNhc2VzLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
