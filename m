Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D8484E2F
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 16:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9FC6E6FF;
	Wed,  7 Aug 2019 14:06:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net
 [194.109.24.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1AA89D8A;
 Wed,  7 Aug 2019 08:51:21 +0000 (UTC)
Received: from [IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747]
 ([IPv6:2001:983:e9a7:1:9c05:4bbc:890e:7747])
 by smtp-cloud9.xs4all.net with ESMTPA
 id vHfBhjvBuAffAvHfDh7OBy; Wed, 07 Aug 2019 10:51:20 +0200
Subject: Re: [PATCH v3 10/41] media/ivtv: convert put_page() to
 put_user_page*()
To: john.hubbard@gmail.com, Andrew Morton <akpm@linux-foundation.org>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
 <20190807013340.9706-11-jhubbard@nvidia.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6fd38719-b5d3-f981-732f-da904e029546@xs4all.nl>
Date: Wed, 7 Aug 2019 10:51:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190807013340.9706-11-jhubbard@nvidia.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfMJxwy/aLQOuQbf06fYFW7+YfWl4BADGtFuQE6wXUrTjdGOxgky6uB//ESvSCh+yVYUjsu+P3ALVGvunyB2+4QNbiR9U1sMYhv33IEL6pdyKQiMVj8T1
 W1Qkt4/A8zg1aaKiXQLOb9cAEBeGuXUGjP0ApW7QHZ9+dJcj1rZJOG9kuRWyqdkLdl0Xfd+YU4Sk6qze6hklKEmlvnGPBahaqqNlqtFrPY2VYZgE8xlevbPK
 VYzwfyBnV0qB7sk2HJHbwtjw82ezllVmshbYtU2bjc7wM9hsKDG6EcPPmsd9lrPWAB9FBL1Y3g8hvBHaWnOx4q3kfDEr6Y3kC/4CbXRQ20FpJPAzV81+yAGi
 +cKudbAsX3yt4NQHLMq6NA6K0kBILjc1co+39hFkrrZIcUvJwiKdy8NMve+H6E2GJnEUUv4nGFbjKuVZLLH5y+b+1vAe1RnVhiytR5yxpsF6hz0tRaR6dO/m
 bKPKNqsFsYXDJ5W59C6b3zicjNWHQZiEn7R8u8OkVB9sGerU7xu4rh8uGzZcq6amwD2COMghZJgTrNiun/ifaDQhmzzN53FDOAKM+vszwSUJENplETndDo8y
 lmjjtBHkM72XNJj8RdBdJI0SZn59/rf//zMIHHt6NgU9mNPP3mXofWS+FI78JEBQKLhYLHJa0ha02bP8S2wsCqhiBYGCYfLM5YjnglwHdz5MRKNNPyE0/oCr
 dZ1pq2UTafijHXzLpcISRXLWw9AZnmu/wF9aLzcClow1YFgj8I4CVeEQWdBw+L0MQjl3rEanK6AEfKDCQJnJLHrgYCJZzK8lNhtogle+zBwwTVUbelovesg0
 2Z/LL+E2WfZzXhib9FscV/8Rh9ToBgNbNMhdUU+hlXoQnZWmFz4spOz6uc44jjnJMhTqUTTg5hrVWn9mTUsqOLeTtpY8kW/K2cuWdgF0wrxh68Tha0mbWKIT
 h1eKpvM3yCzq6DBvt+4fyEiX9NjhFQCa7MNabjtWGhlXyk0ZjWF4ffIi9wV7oklEl1VYZUg79U6dELOAAE9vul6NRqDojlMJCqNaHjnuq3fjMxzEn5uV49mz
 FPD7znLfhbE8FWiYTDTLLH+F8vVBTzJTBgpIxygp14Fz2rP8/IvLLQTaYZiAs1yls952pasjas0Q53pSxIQVarur6cT2MqxBbc5Dkh7+Kfq7Y91uNNAg04iu
 d3+RJ+RCE2l1cbWqQWuXhu2j3C3rQr6dROpJhXRRXQP1J97AvtdCiS7dL9s6gULkooJ1lyTBk0aSFxIoqVYcIP0df/i5MmVLM4jFetRz5G+ThUJC0Gc1KTni
 J8I2ou/BC1bOXOJ9lSOzAqFgDoYHvEZlRb2SvXzzXkDYqMgFYolGY5VKp9uCTVWd2PQmaBlbu1lHchM+NnqdfZ7YxkxIhSoqPdSqtG27MX0XBSfBp4v/ADsP
 H7xofpTtcDVeVERyWqD+q5UMM2Wpkx8uIf59scuWLYExFj2E6FLh/6DxVIE2D4OhS9udVr+503DGAmvegA+vJlyXKbNabKFcW5bmXYY95PEPyy1wNsxvcmw6
 BPLri27Pq99nmIRm69PM0/43YEDR6U4lfeDpNuOtu7XhL7tzHXBogR/ytIhLuavtudk3kQ1Nk50AAQdwvvIdGe/4
X-Mailman-Approved-At: Wed, 07 Aug 2019 14:06:39 +0000
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Andy Walls <awalls@md.metrocast.net>, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gOC83LzE5IDM6MzMgQU0sIGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6Cj4gRnJvbTog
Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+IAo+IEZvciBwYWdlcyB0aGF0IHdl
cmUgcmV0YWluZWQgdmlhIGdldF91c2VyX3BhZ2VzKigpLCByZWxlYXNlIHRob3NlIHBhZ2VzCj4g
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgo+IHJlbGVhc2VfcGFnZXMoKS4KPiAKPiBUaGlzIGlzIHBhcnQgYSB0cmVlLXdp
ZGUgY29udmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKPiAoIm1t
OiBpbnRyb2R1Y2UgcHV0X3VzZXJfcGFnZSooKSwgcGxhY2Vob2xkZXIgdmVyc2lvbnMiKS4KPiAK
PiBDYzogQW5keSBXYWxscyA8YXdhbGxzQG1kLm1ldHJvY2FzdC5uZXQ+Cj4gQ2M6IE1hdXJvIENh
cnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPgo+IENjOiBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRp
YS5jb20+CgpBY2tlZC1ieTogSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+
CgpSZWdhcmRzLAoKCUhhbnMKCj4gLS0tCj4gIGRyaXZlcnMvbWVkaWEvcGNpL2l2dHYvaXZ0di11
ZG1hLmMgfCAxNCArKysrLS0tLS0tLS0tLQo+ICBkcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHYt
eXV2LmMgIHwgMTEgKysrLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDE4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BjaS9p
dnR2L2l2dHYtdWRtYS5jIGIvZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2LXVkbWEuYwo+IGlu
ZGV4IDVmODg4MzAzMWM5Yy4uN2M3ZjMzYzI0MTJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWVk
aWEvcGNpL2l2dHYvaXZ0di11ZG1hLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2
dHYtdWRtYS5jCj4gQEAgLTkyLDcgKzkyLDcgQEAgaW50IGl2dHZfdWRtYV9zZXR1cChzdHJ1Y3Qg
aXZ0diAqaXR2LCB1bnNpZ25lZCBsb25nIGl2dHZfZGVzdF9hZGRyLAo+ICB7Cj4gIAlzdHJ1Y3Qg
aXZ0dl9kbWFfcGFnZV9pbmZvIHVzZXJfZG1hOwo+ICAJc3RydWN0IGl2dHZfdXNlcl9kbWEgKmRt
YSA9ICZpdHYtPnVkbWE7Cj4gLQlpbnQgaSwgZXJyOwo+ICsJaW50IGVycjsKPiAgCj4gIAlJVlRW
X0RFQlVHX0RNQSgiaXZ0dl91ZG1hX3NldHVwLCBkc3Q6IDB4JTA4eFxuIiwgKHVuc2lnbmVkIGlu
dClpdnR2X2Rlc3RfYWRkcik7Cj4gIAo+IEBAIC0xMTksOCArMTE5LDcgQEAgaW50IGl2dHZfdWRt
YV9zZXR1cChzdHJ1Y3QgaXZ0diAqaXR2LCB1bnNpZ25lZCBsb25nIGl2dHZfZGVzdF9hZGRyLAo+
ICAJCUlWVFZfREVCVUdfV0FSTigiZmFpbGVkIHRvIG1hcCB1c2VyIHBhZ2VzLCByZXR1cm5lZCAl
ZCBpbnN0ZWFkIG9mICVkXG4iLAo+ICAJCQkgICBlcnIsIHVzZXJfZG1hLnBhZ2VfY291bnQpOwo+
ICAJCWlmIChlcnIgPj0gMCkgewo+IC0JCQlmb3IgKGkgPSAwOyBpIDwgZXJyOyBpKyspCj4gLQkJ
CQlwdXRfcGFnZShkbWEtPm1hcFtpXSk7Cj4gKwkJCXB1dF91c2VyX3BhZ2VzKGRtYS0+bWFwLCBl
cnIpOwo+ICAJCQlyZXR1cm4gLUVJTlZBTDsKPiAgCQl9Cj4gIAkJcmV0dXJuIGVycjsKPiBAQCAt
MTMwLDkgKzEyOSw3IEBAIGludCBpdnR2X3VkbWFfc2V0dXAoc3RydWN0IGl2dHYgKml0diwgdW5z
aWduZWQgbG9uZyBpdnR2X2Rlc3RfYWRkciwKPiAgCj4gIAkvKiBGaWxsIFNHIExpc3Qgd2l0aCBu
ZXcgdmFsdWVzICovCj4gIAlpZiAoaXZ0dl91ZG1hX2ZpbGxfc2dfbGlzdChkbWEsICZ1c2VyX2Rt
YSwgMCkgPCAwKSB7Cj4gLQkJZm9yIChpID0gMDsgaSA8IGRtYS0+cGFnZV9jb3VudDsgaSsrKSB7
Cj4gLQkJCXB1dF9wYWdlKGRtYS0+bWFwW2ldKTsKPiAtCQl9Cj4gKwkJcHV0X3VzZXJfcGFnZXMo
ZG1hLT5tYXAsIGRtYS0+cGFnZV9jb3VudCk7Cj4gIAkJZG1hLT5wYWdlX2NvdW50ID0gMDsKPiAg
CQlyZXR1cm4gLUVOT01FTTsKPiAgCX0KPiBAQCAtMTUzLDcgKzE1MCw2IEBAIGludCBpdnR2X3Vk
bWFfc2V0dXAoc3RydWN0IGl2dHYgKml0diwgdW5zaWduZWQgbG9uZyBpdnR2X2Rlc3RfYWRkciwK
PiAgdm9pZCBpdnR2X3VkbWFfdW5tYXAoc3RydWN0IGl2dHYgKml0dikKPiAgewo+ICAJc3RydWN0
IGl2dHZfdXNlcl9kbWEgKmRtYSA9ICZpdHYtPnVkbWE7Cj4gLQlpbnQgaTsKPiAgCj4gIAlJVlRW
X0RFQlVHX0lORk8oIml2dHZfdW5tYXBfdXNlcl9kbWFcbiIpOwo+ICAKPiBAQCAtMTcwLDkgKzE2
Niw3IEBAIHZvaWQgaXZ0dl91ZG1hX3VubWFwKHN0cnVjdCBpdnR2ICppdHYpCj4gIAlpdnR2X3Vk
bWFfc3luY19mb3JfY3B1KGl0dik7Cj4gIAo+ICAJLyogUmVsZWFzZSBVc2VyIFBhZ2VzICovCj4g
LQlmb3IgKGkgPSAwOyBpIDwgZG1hLT5wYWdlX2NvdW50OyBpKyspIHsKPiAtCQlwdXRfcGFnZShk
bWEtPm1hcFtpXSk7Cj4gLQl9Cj4gKwlwdXRfdXNlcl9wYWdlcyhkbWEtPm1hcCwgZG1hLT5wYWdl
X2NvdW50KTsKPiAgCWRtYS0+cGFnZV9jb3VudCA9IDA7Cj4gIH0KPiAgCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvcGNpL2l2dHYvaXZ0di15dXYuYyBiL2RyaXZlcnMvbWVkaWEvcGNpL2l2
dHYvaXZ0di15dXYuYwo+IGluZGV4IGNkMmZlMmQ0NDRjMC4uMmM2MWExMWQzOTFkIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGNpL2l2dHYvaXZ0di15dXYuYwo+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvcGNpL2l2dHYvaXZ0di15dXYuYwo+IEBAIC0zMCw3ICszMCw2IEBAIHN0YXRpYyBpbnQg
aXZ0dl95dXZfcHJlcF91c2VyX2RtYShzdHJ1Y3QgaXZ0diAqaXR2LCBzdHJ1Y3QgaXZ0dl91c2Vy
X2RtYSAqZG1hLAo+ICAJc3RydWN0IHl1dl9wbGF5YmFja19pbmZvICp5aSA9ICZpdHYtPnl1dl9p
bmZvOwo+ICAJdTggZnJhbWUgPSB5aS0+ZHJhd19mcmFtZTsKPiAgCXN0cnVjdCB5dXZfZnJhbWVf
aW5mbyAqZiA9ICZ5aS0+bmV3X2ZyYW1lX2luZm9bZnJhbWVdOwo+IC0JaW50IGk7Cj4gIAlpbnQg
eV9wYWdlcywgdXZfcGFnZXM7Cj4gIAl1bnNpZ25lZCBsb25nIHlfYnVmZmVyX29mZnNldCwgdXZf
YnVmZmVyX29mZnNldDsKPiAgCWludCB5X2RlY29kZV9oZWlnaHQsIHV2X2RlY29kZV9oZWlnaHQs
IHlfc2l6ZTsKPiBAQCAtODEsOCArODAsNyBAQCBzdGF0aWMgaW50IGl2dHZfeXV2X3ByZXBfdXNl
cl9kbWEoc3RydWN0IGl2dHYgKml0diwgc3RydWN0IGl2dHZfdXNlcl9kbWEgKmRtYSwKPiAgCQkJ
CSB1dl9wYWdlcywgdXZfZG1hLnBhZ2VfY291bnQpOwo+ICAKPiAgCQkJaWYgKHV2X3BhZ2VzID49
IDApIHsKPiAtCQkJCWZvciAoaSA9IDA7IGkgPCB1dl9wYWdlczsgaSsrKQo+IC0JCQkJCXB1dF9w
YWdlKGRtYS0+bWFwW3lfcGFnZXMgKyBpXSk7Cj4gKwkJCQlwdXRfdXNlcl9wYWdlcygmZG1hLT5t
YXBbeV9wYWdlc10sIHV2X3BhZ2VzKTsKPiAgCQkJCXJjID0gLUVGQVVMVDsKPiAgCQkJfSBlbHNl
IHsKPiAgCQkJCXJjID0gdXZfcGFnZXM7Cj4gQEAgLTkzLDggKzkxLDcgQEAgc3RhdGljIGludCBp
dnR2X3l1dl9wcmVwX3VzZXJfZG1hKHN0cnVjdCBpdnR2ICppdHYsIHN0cnVjdCBpdnR2X3VzZXJf
ZG1hICpkbWEsCj4gIAkJCQkgeV9wYWdlcywgeV9kbWEucGFnZV9jb3VudCk7Cj4gIAkJfQo+ICAJ
CWlmICh5X3BhZ2VzID49IDApIHsKPiAtCQkJZm9yIChpID0gMDsgaSA8IHlfcGFnZXM7IGkrKykK
PiAtCQkJCXB1dF9wYWdlKGRtYS0+bWFwW2ldKTsKPiArCQkJcHV0X3VzZXJfcGFnZXMoZG1hLT5t
YXAsIHlfcGFnZXMpOwo+ICAJCQkvKgo+ICAJCQkgKiBJbmhlcml0IHRoZSAtRUZBVUxUIGZyb20g
cmMncwo+ICAJCQkgKiBpbml0aWFsaXphdGlvbiwgYnV0IGFsbG93IGl0IHRvIGJlCj4gQEAgLTEx
Miw5ICsxMDksNyBAQCBzdGF0aWMgaW50IGl2dHZfeXV2X3ByZXBfdXNlcl9kbWEoc3RydWN0IGl2
dHYgKml0diwgc3RydWN0IGl2dHZfdXNlcl9kbWEgKmRtYSwKPiAgCS8qIEZpbGwgJiBtYXAgU0cg
TGlzdCAqLwo+ICAJaWYgKGl2dHZfdWRtYV9maWxsX3NnX2xpc3QgKGRtYSwgJnV2X2RtYSwgaXZ0
dl91ZG1hX2ZpbGxfc2dfbGlzdCAoZG1hLCAmeV9kbWEsIDApKSA8IDApIHsKPiAgCQlJVlRWX0RF
QlVHX1dBUk4oImNvdWxkIG5vdCBhbGxvY2F0ZSBib3VuY2UgYnVmZmVycyBmb3IgaGlnaG1lbSB1
c2Vyc3BhY2UgYnVmZmVyc1xuIik7Cj4gLQkJZm9yIChpID0gMDsgaSA8IGRtYS0+cGFnZV9jb3Vu
dDsgaSsrKSB7Cj4gLQkJCXB1dF9wYWdlKGRtYS0+bWFwW2ldKTsKPiAtCQl9Cj4gKwkJcHV0X3Vz
ZXJfcGFnZXMoZG1hLT5tYXAsIGRtYS0+cGFnZV9jb3VudCk7Cj4gIAkJZG1hLT5wYWdlX2NvdW50
ID0gMDsKPiAgCQlyZXR1cm4gLUVOT01FTTsKPiAgCX0KPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
