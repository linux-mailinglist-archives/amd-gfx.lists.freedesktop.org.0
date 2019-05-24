Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCB029A85
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 17:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D896E112;
	Fri, 24 May 2019 15:01:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96CD6E0DF;
 Fri, 24 May 2019 14:26:04 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4OE8bjv170883;
 Fri, 24 May 2019 14:25:48 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 2smsk5sewf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 May 2019 14:25:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4OEPft9008165;
 Fri, 24 May 2019 14:25:48 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2smsgtwpfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 May 2019 14:25:47 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4OEPkT8002811;
 Fri, 24 May 2019 14:25:46 GMT
Received: from [192.168.1.16] (/24.9.64.241)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 24 May 2019 14:25:45 +0000
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
To: Catalin Marinas <catalin.marinas@arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp> <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
 <20190523201105.oifkksus4rzcwqt4@mbp>
 <ffe58af3-7c70-d559-69f6-1f6ebcb0fec6@oracle.com>
 <20190524101139.36yre4af22bkvatx@mbp>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <c6dd53d8-142b-3d8d-6a40-d21c5ee9d272@oracle.com>
Date: Fri, 24 May 2019 08:25:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524101139.36yre4af22bkvatx@mbp>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9266
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905240096
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9266
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905240096
X-Mailman-Approved-At: Fri, 24 May 2019 15:01:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=OJhMCvW2kp8bOu0Aj9xHYqe11sQBRT1hGdecAvzomjs=;
 b=Ymf3dbVVSk/usGv/LWyN8I3YdUizbsu/NiEI/I45nxcgQtjyJP24xaCjavUVvrMsM2O6
 yEP3RCJrHDJF5nnRuz4iw9XN7owpeQqjW6DAcNsFAO79ZSNGKG1WbLKp1rBvO3sJA5Dr
 +fBrLpy1lQu6d91Ea6iJuVHlzyPxZBxwhYSSJ8nFZjA8cuYTCNKl6zTycOpBAIsWwpl+
 g1GFUsvpVXx8ufMZ3zfNa2womboo5KLhh4oJCIIc9jToeIVyIP/Opv9xH3hpRByfsilL
 vIwIH66z4yFn+YxGOtQgVRvyfsmkvl77RxspM3YzOuGKjPJ5b3GlOA6tg3BSpgx4LR4x mw== 
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
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgenii Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
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

T24gNS8yNC8xOSA0OjExIEFNLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gT24gVGh1LCBNYXkg
MjMsIDIwMTkgYXQgMDM6NDk6MDVQTSAtMDYwMCwgS2hhbGlkIEF6aXogd3JvdGU6Cj4+IE9uIDUv
MjMvMTkgMjoxMSBQTSwgQ2F0YWxpbiBNYXJpbmFzIHdyb3RlOgo+Pj4gT24gVGh1LCBNYXkgMjMs
IDIwMTkgYXQgMTE6NTE6NDBBTSAtMDYwMCwgS2hhbGlkIEF6aXogd3JvdGU6Cj4+Pj4gT24gNS8y
MS8xOSA2OjA0IFBNLCBLZWVzIENvb2sgd3JvdGU6Cj4+Pj4+IEFzIGFuIGFzaWRlOiBJIHRoaW5r
IFNwYXJjIEFESSBzdXBwb3J0IGluIExpbnV4IGFjdHVhbGx5IHNpZGUtc3RlcHBlZAo+Pj4+PiB0
aGlzWzFdIChpLmUuIGNob3NlICJzb2x1dGlvbiAxIik6ICJBbGwgYWRkcmVzc2VzIHBhc3NlZCB0
byBrZXJuZWwgbXVzdAo+Pj4+PiBiZSBub24tQURJIHRhZ2dlZCBhZGRyZXNzZXMuIiAoQW5kIHNh
ZGx5LCAiS2VybmVsIGRvZXMgbm90IGVuYWJsZSBBREkKPj4+Pj4gZm9yIGtlcm5lbCBjb2RlLiIp
IEkgdGhpbmsgdGhpcyB3YXMgYSBtaXN0YWtlIHdlIHNob3VsZCBub3QgcmVwZWF0IGZvcgo+Pj4+
PiBhcm02NCAod2UgZG8gc2VlbSB0byBiZSBhdCBsZWFzdCBpbiBhZ3JlZW1lbnQgYWJvdXQgdGhp
cywgSSB0aGluaykuCj4+Pj4+Cj4+Pj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRj
aHdvcmsvcGF0Y2gvNjU0NDgxLwo+Pj4+Cj4+Pj4gVGhhdCBpcyBhIHZlcnkgZWFybHkgdmVyc2lv
biBvZiB0aGUgc3BhcmMgQURJIHBhdGNoLiBTdXBwb3J0IGZvciB0YWdnZWQKPj4+PiBhZGRyZXNz
ZXMgaW4gc3lzY2FsbHMgd2FzIGFkZGVkIGluIGxhdGVyIHZlcnNpb25zIGFuZCBpcyBpbiB0aGUg
cGF0Y2gKPj4+PiB0aGF0IGlzIGluIHRoZSBrZXJuZWwuCj4+Pgo+Pj4gSSB0cmllZCB0byBmaWd1
cmUgb3V0IGJ1dCBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhlIHNwYXJjIHBvcnQuIEhvdyBkaWQK
Pj4+IHlvdSBzb2x2ZSB0aGUgdGFnZ2VkIGFkZHJlc3MgZ29pbmcgaW50byB2YXJpb3VzIHN5c2Nh
bGwgaW1wbGVtZW50YXRpb25zCj4+PiBpbiB0aGUga2VybmVsIChlLmcuIHN5c193cml0ZSk/IElz
IHRoZSB0YWcgcmVtb3ZlZCBvbiBrZXJuZWwgZW50cnkgb3IgaXQKPj4+IGVuZHMgdXAgZGVlcGVy
IGluIHRoZSBjb3JlIGNvZGU/Cj4+Cj4+IEFub3RoZXIgc3BvdCBJIHNob3VsZCBwb2ludCBvdXQg
aW4gQURJIHBhdGNoIC0gVGFncyBhcmUgbm90IHN0b3JlZCBpbgo+PiBWTUFzIGFuZCBJT01NVSBk
b2VzIG5vdCBzdXBwb3J0IEFESSB0YWdzIG9uIE03LiBBREkgdGFncyBhcmUgc3RyaXBwZWQKPj4g
YmVmb3JlIHVzZXJzcGFjZSBhZGRyZXNzZXMgYXJlIHBhc3NlZCB0byBJT01NVSBpbiB0aGUgZm9s
bG93aW5nIHNuaXBwZXQKPj4gZnJvbSB0aGUgcGF0Y2g6Cj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNo
L3NwYXJjL21tL2d1cC5jIGIvYXJjaC9zcGFyYy9tbS9ndXAuYwo+PiBpbmRleCA1MzM1YmEzYzg1
MGUuLjM1N2I2MDQ3NjUzYSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9zcGFyYy9tbS9ndXAuYwo+PiAr
KysgYi9hcmNoL3NwYXJjL21tL2d1cC5jCj4+IEBAIC0yMDEsNiArMjAyLDI0IEBAIGludCBfX2dl
dF91c2VyX3BhZ2VzX2Zhc3QodW5zaWduZWQgbG9uZyBzdGFydCwgaW50Cj4+IG5yX3BhZ2VzCj4+
ICwgaW50IHdyaXRlLAo+PiAgICAgICAgIHBnZF90ICpwZ2RwOwo+PiAgICAgICAgIGludCBuciA9
IDA7Cj4+Cj4+ICsjaWZkZWYgQ09ORklHX1NQQVJDNjQKPj4gKyAgICAgICBpZiAoYWRpX2NhcGFi
bGUoKSkgewo+PiArICAgICAgICAgICAgICAgbG9uZyBhZGRyID0gc3RhcnQ7Cj4+ICsKPj4gKyAg
ICAgICAgICAgICAgIC8qIElmIHVzZXJzcGFjZSBoYXMgcGFzc2VkIGEgdmVyc2lvbmVkIGFkZHJl
c3MsIGtlcm5lbAo+PiArICAgICAgICAgICAgICAgICogd2lsbCBub3QgZmluZCBpdCBpbiB0aGUg
Vk1BcyBzaW5jZSBpdCBkb2VzIG5vdCBzdG9yZQo+PiArICAgICAgICAgICAgICAgICogdGhlIHZl
cnNpb24gdGFncyBpbiB0aGUgbGlzdCBvZiBWTUFzLiBTdG9yaW5nIHZlcnNpb24KPj4gKyAgICAg
ICAgICAgICAgICAqIHRhZ3MgaW4gbGlzdCBvZiBWTUFzIGlzIGltcHJhY3RpY2FsIHNpbmNlIHRo
ZXkgY2FuIGJlCj4+ICsgICAgICAgICAgICAgICAgKiBjaGFuZ2VkIGFueSB0aW1lIGZyb20gdXNl
cnNwYWNlIHdpdGhvdXQgZHJvcHBpbmcgaW50bwo+PiArICAgICAgICAgICAgICAgICoga2VybmVs
LiBBbnkgYWRkcmVzcyBzZWFyY2ggaW4gVk1BcyB3aWxsIGJlIGRvbmUgd2l0aAo+PiArICAgICAg
ICAgICAgICAgICogbm9uLXZlcnNpb25lZCBhZGRyZXNzZXMuIEVuc3VyZSB0aGUgQURJIHZlcnNp
b24gYml0cwo+PiArICAgICAgICAgICAgICAgICogYXJlIGRyb3BwZWQgaGVyZSBieSBzaWduIGV4
dGVuZGluZyB0aGUgbGFzdCBiaXQgYmVmb3JlCj4+ICsgICAgICAgICAgICAgICAgKiBBREkgYml0
cy4gSU9NTVUgZG9lcyBub3QgaW1wbGVtZW50IHZlcnNpb24gdGFncy4KPj4gKyAgICAgICAgICAg
ICAgICAqLwo+PiArICAgICAgICAgICAgICAgYWRkciA9IChhZGRyIDw8IChsb25nKWFkaV9uYml0
cygpKSA+PiAobG9uZylhZGlfbmJpdHMoKTsKPj4gKyAgICAgICAgICAgICAgIHN0YXJ0ID0gYWRk
cjsKPj4gKyAgICAgICB9Cj4+ICsjZW5kaWYKPj4gICAgICAgICBzdGFydCAmPSBQQUdFX01BU0s7
Cj4+ICAgICAgICAgYWRkciA9IHN0YXJ0Owo+PiAgICAgICAgIGxlbiA9ICh1bnNpZ25lZCBsb25n
KSBucl9wYWdlcyA8PCBQQUdFX1NISUZUOwo+IAo+IFRoYW5rcyBLaGFsaWQuIEkgbWlzc2VkIHRo
YXQgc3BhcmMgZG9lcyBub3QgZW5hYmxlIEhBVkVfR0VORVJJQ19HVVAsIHNvCj4geW91IGZpeCB0
aGlzIGNhc2UgaGVyZS4gSWYgd2UgYWRkIHRoZSBnZW5lcmljIHVudGFnZ2VkX2FkZHIoKSBtYWNy
byBpbgo+IHRoZSBnZW5lcmljIGNvZGUsIEkgdGhpbmsgc3BhcmMgY2FuIHN0YXJ0IG1ha2luZyB1
c2Ugb2YgaXQgcmF0aGVyIHRoYW4KPiBvcGVuLWNvZGluZyB0aGUgc2hpZnRzLgoKSGkgQ2F0YWxp
biwKClllcywgdGhhdCB3aWxsIGJlIGdvb2QuIFJpZ2h0IG5vdyBhZGRyZXNzZXMgYXJlIHVudGFn
Z2VkIGluIHNwYXJjIGNvZGUKaW4gb25seSB0d28gc3BvdHMgYnV0IHRoYXQgd2lsbCBleHBhbmQg
YXMgd2UgZXhwYW5kIHVzZSBvZiB0YWdzLgpTY2FsYWJhbGUgc29sdXRpb24gaXMgZGVmaW5pdGVs
eSBiZXR0ZXIuCgo+IAo+IFRoZXJlIGFyZSBhIGZldyBvdGhlciBvdGhlciBwbGFjZXMgd2hlcmUg
dGFncyBjYW4gbGVhayBhbmQgdGhlIGNvcmUgY29kZQo+IHdvdWxkIGdldCBjb25mdXNlZCAoZm9y
IGV4YW1wbGUsIG1hZHZpc2UoKSkuIEkgcHJlc3VtZSB5b3VyIHVzZXIgc3BhY2UKPiBkb2Vzbid0
IGV4ZXJjaXNlIHRoZW0uIE9uIGFybTY0IHdlIHBsYW4gdG8ganVzdCBhbGxvdyB0aGUgQyBsaWJy
YXJ5IHRvCj4gdGFnIGFueSBuZXcgbWVtb3J5IGFsbG9jYXRpb24sIHNvIHRob3NlIGNvcmUgY29k
ZSBwYXRocyB3b3VsZCBuZWVkIHRvIGJlCj4gY292ZXJlZC4KPiAKPiBBbmQgc2ltaWxhcmx5LCBk
ZXZpY2VzLCBJT01NVSwgYW55IERNQSB3b3VsZCBpZ25vcmUgdGFncy4KPiAKClJpZ2h0LiBZb3Ug
YXJlIGRvaW5nIGxvdCBtb3JlIHdpdGggdGFncyB0aGFuIHNwYXJjIGNvZGUgaW50ZW5kZWQgdG8g
ZG8uCkkgaGFkIGxvb2tlZCBpbnRvIGltcGxlbWVudGluZyBqdXN0IG1hbGxvYygpLCBtbWFwKCkg
YW5kIHBvc3NpYmx5CnNobWF0KCkgaW4gbGlicmFyeSB0aGF0IGF1dG9tYXRpY2FsbHkgdGFncyBw
b2ludGVycy4gRXhwYW5kaW5nIHRhZ3MgdG8KYW55IHBvaW50ZXJzIGluIEMgbGlicmFyeSB3aWxs
IHJlcXVpcmUgY292ZXJpbmcgbG90IG1vcmUgcGF0aHMgaW4ga2VybmVsLgoKLS0KS2hhbGlkCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
