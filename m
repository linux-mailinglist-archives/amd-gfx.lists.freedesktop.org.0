Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA716BF1D
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 17:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33EE6E221;
	Wed, 17 Jul 2019 15:29:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 4812 seconds by postgrey-1.36 at gabe;
 Wed, 17 Jul 2019 12:29:47 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF60B8941D
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 12:29:47 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6HB5ox0151958
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 07:09:31 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tt0pmwdxf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 07:09:31 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <amd-gfx@lists.freedesktop.org> from <rppt@linux.ibm.com>;
 Wed, 17 Jul 2019 12:09:29 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 17 Jul 2019 12:09:19 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6HB9I7C39190742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jul 2019 11:09:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C29152063;
 Wed, 17 Jul 2019 11:09:18 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.168])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 366B052050;
 Wed, 17 Jul 2019 11:09:15 +0000 (GMT)
Date: Wed, 17 Jul 2019 14:09:13 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v18 08/15] userfaultfd: untag user pointers
References: <cover.1561386715.git.andreyknvl@google.com>
 <d8e3b9a819e98d6527e506027b173b128a148d3c.1561386715.git.andreyknvl@google.com>
 <20190624175120.GN29120@arrakis.emea.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624175120.GN29120@arrakis.emea.arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19071711-0020-0000-0000-00000354AA32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071711-0021-0000-0000-000021A87C56
Message-Id: <20190717110910.GA12017@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-17_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907170135
X-Mailman-Approved-At: Wed, 17 Jul 2019 15:29:17 +0000
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
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
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

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDY6NTE6MjFQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIE1vbiwgSnVuIDI0LCAyMDE5IGF0IDA0OjMyOjUzUE0gKzAyMDAsIEFuZHJl
eSBLb25vdmFsb3Ygd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0
aGF0IGV4dGVuZHMga2VybmVsIEFCSSB0byBhbGxvdyB0byBwYXNzCj4gPiB0YWdnZWQgdXNlciBw
b2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyIHRo
YW4KPiA+IDB4MDApIGFzIHN5c2NhbGwgYXJndW1lbnRzLgo+ID4gCj4gPiB1c2VyZmF1bHRmZCBj
b2RlIHVzZSBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZvciB2bWEgbG9va3Vwcywgd2hpY2ggY2Fu
Cj4gPiBvbmx5IGJ5IGRvbmUgd2l0aCB1bnRhZ2dlZCBwb2ludGVycy4KPiA+IAo+ID4gVW50YWcg
dXNlciBwb2ludGVycyBpbiB2YWxpZGF0ZV9yYW5nZSgpLgo+ID4gCj4gPiBSZXZpZXdlZC1ieTog
VmluY2Vuem8gRnJhc2Npbm8gPHZpbmNlbnpvLmZyYXNjaW5vQGFybS5jb20+Cj4gPiBSZXZpZXdl
ZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPiA+IFJldmll
d2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4g
IGZzL3VzZXJmYXVsdGZkLmMgfCAyMiArKysrKysrKysrKystLS0tLS0tLS0tCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+IFNhbWUgaGVy
ZSwgaXQgbmVlZHMgYW4gYWNrIGZyb20gQWwgVmlyby4KClRoZSB1c2VyZmF1bHQgcGF0Y2hlcyB1
c3VhbGx5IGdvIHZpYSAtbW0gdHJlZSwgbm90IHN1cmUgaWYgQWwgbG9va3MgYXQgdGhlbSA6KSAK
IApGV0lXLCB5b3UgY2FuIGFkZCAKClJldmlld2VkLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxp
bnV4LmlibS5jb20+Cgo+ID4gZGlmZiAtLWdpdCBhL2ZzL3VzZXJmYXVsdGZkLmMgYi9mcy91c2Vy
ZmF1bHRmZC5jCj4gPiBpbmRleCBhZTBiOGI1ZjY5ZTYuLmMyYmUzNmExNjhjYSAxMDA2NDQKPiA+
IC0tLSBhL2ZzL3VzZXJmYXVsdGZkLmMKPiA+ICsrKyBiL2ZzL3VzZXJmYXVsdGZkLmMKPiA+IEBA
IC0xMjYxLDIxICsxMjYxLDIzIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCB3YWtlX3Vz
ZXJmYXVsdChzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgsCj4gPiAgfQo+ID4gIAo+ID4gIHN0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IHZhbGlkYXRlX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tLAo+ID4gLQkJCQkJICBfX3U2NCBzdGFydCwgX191NjQgbGVuKQo+ID4gKwkJCQkJICBfX3U2
NCAqc3RhcnQsIF9fdTY0IGxlbikKPiA+ICB7Cj4gPiAgCV9fdTY0IHRhc2tfc2l6ZSA9IG1tLT50
YXNrX3NpemU7Cj4gPiAgCj4gPiAtCWlmIChzdGFydCAmIH5QQUdFX01BU0spCj4gPiArCSpzdGFy
dCA9IHVudGFnZ2VkX2FkZHIoKnN0YXJ0KTsKPiA+ICsKPiA+ICsJaWYgKCpzdGFydCAmIH5QQUdF
X01BU0spCj4gPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiA+ICAJaWYgKGxlbiAmIH5QQUdFX01BU0sp
Cj4gPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiA+ICAJaWYgKCFsZW4pCj4gPiAgCQlyZXR1cm4gLUVJ
TlZBTDsKPiA+IC0JaWYgKHN0YXJ0IDwgbW1hcF9taW5fYWRkcikKPiA+ICsJaWYgKCpzdGFydCA8
IG1tYXBfbWluX2FkZHIpCj4gPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiA+IC0JaWYgKHN0YXJ0ID49
IHRhc2tfc2l6ZSkKPiA+ICsJaWYgKCpzdGFydCA+PSB0YXNrX3NpemUpCj4gPiAgCQlyZXR1cm4g
LUVJTlZBTDsKPiA+IC0JaWYgKGxlbiA+IHRhc2tfc2l6ZSAtIHN0YXJ0KQo+ID4gKwlpZiAobGVu
ID4gdGFza19zaXplIC0gKnN0YXJ0KQo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gPiAgCXJldHVy
biAwOwo+ID4gIH0KPiA+IEBAIC0xMzI1LDcgKzEzMjcsNyBAQCBzdGF0aWMgaW50IHVzZXJmYXVs
dGZkX3JlZ2lzdGVyKHN0cnVjdCB1c2VyZmF1bHRmZF9jdHggKmN0eCwKPiA+ICAJCWdvdG8gb3V0
Owo+ID4gIAl9Cj4gPiAgCj4gPiAtCXJldCA9IHZhbGlkYXRlX3JhbmdlKG1tLCB1ZmZkaW9fcmVn
aXN0ZXIucmFuZ2Uuc3RhcnQsCj4gPiArCXJldCA9IHZhbGlkYXRlX3JhbmdlKG1tLCAmdWZmZGlv
X3JlZ2lzdGVyLnJhbmdlLnN0YXJ0LAo+ID4gIAkJCSAgICAgdWZmZGlvX3JlZ2lzdGVyLnJhbmdl
Lmxlbik7Cj4gPiAgCWlmIChyZXQpCj4gPiAgCQlnb3RvIG91dDsKPiA+IEBAIC0xNTE0LDcgKzE1
MTYsNyBAQCBzdGF0aWMgaW50IHVzZXJmYXVsdGZkX3VucmVnaXN0ZXIoc3RydWN0IHVzZXJmYXVs
dGZkX2N0eCAqY3R4LAo+ID4gIAlpZiAoY29weV9mcm9tX3VzZXIoJnVmZmRpb191bnJlZ2lzdGVy
LCBidWYsIHNpemVvZih1ZmZkaW9fdW5yZWdpc3RlcikpKQo+ID4gIAkJZ290byBvdXQ7Cj4gPiAg
Cj4gPiAtCXJldCA9IHZhbGlkYXRlX3JhbmdlKG1tLCB1ZmZkaW9fdW5yZWdpc3Rlci5zdGFydCwK
PiA+ICsJcmV0ID0gdmFsaWRhdGVfcmFuZ2UobW0sICZ1ZmZkaW9fdW5yZWdpc3Rlci5zdGFydCwK
PiA+ICAJCQkgICAgIHVmZmRpb191bnJlZ2lzdGVyLmxlbik7Cj4gPiAgCWlmIChyZXQpCj4gPiAg
CQlnb3RvIG91dDsKPiA+IEBAIC0xNjY1LDcgKzE2NjcsNyBAQCBzdGF0aWMgaW50IHVzZXJmYXVs
dGZkX3dha2Uoc3RydWN0IHVzZXJmYXVsdGZkX2N0eCAqY3R4LAo+ID4gIAlpZiAoY29weV9mcm9t
X3VzZXIoJnVmZmRpb193YWtlLCBidWYsIHNpemVvZih1ZmZkaW9fd2FrZSkpKQo+ID4gIAkJZ290
byBvdXQ7Cj4gPiAgCj4gPiAtCXJldCA9IHZhbGlkYXRlX3JhbmdlKGN0eC0+bW0sIHVmZmRpb193
YWtlLnN0YXJ0LCB1ZmZkaW9fd2FrZS5sZW4pOwo+ID4gKwlyZXQgPSB2YWxpZGF0ZV9yYW5nZShj
dHgtPm1tLCAmdWZmZGlvX3dha2Uuc3RhcnQsIHVmZmRpb193YWtlLmxlbik7Cj4gPiAgCWlmIChy
ZXQpCj4gPiAgCQlnb3RvIG91dDsKPiA+ICAKPiA+IEBAIC0xNzA1LDcgKzE3MDcsNyBAQCBzdGF0
aWMgaW50IHVzZXJmYXVsdGZkX2NvcHkoc3RydWN0IHVzZXJmYXVsdGZkX2N0eCAqY3R4LAo+ID4g
IAkJCSAgIHNpemVvZih1ZmZkaW9fY29weSktc2l6ZW9mKF9fczY0KSkpCj4gPiAgCQlnb3RvIG91
dDsKPiA+ICAKPiA+IC0JcmV0ID0gdmFsaWRhdGVfcmFuZ2UoY3R4LT5tbSwgdWZmZGlvX2NvcHku
ZHN0LCB1ZmZkaW9fY29weS5sZW4pOwo+ID4gKwlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1t
LCAmdWZmZGlvX2NvcHkuZHN0LCB1ZmZkaW9fY29weS5sZW4pOwo+ID4gIAlpZiAocmV0KQo+ID4g
IAkJZ290byBvdXQ7Cj4gPiAgCS8qCj4gPiBAQCAtMTc2MSw3ICsxNzYzLDcgQEAgc3RhdGljIGlu
dCB1c2VyZmF1bHRmZF96ZXJvcGFnZShzdHJ1Y3QgdXNlcmZhdWx0ZmRfY3R4ICpjdHgsCj4gPiAg
CQkJICAgc2l6ZW9mKHVmZmRpb196ZXJvcGFnZSktc2l6ZW9mKF9fczY0KSkpCj4gPiAgCQlnb3Rv
IG91dDsKPiA+ICAKPiA+IC0JcmV0ID0gdmFsaWRhdGVfcmFuZ2UoY3R4LT5tbSwgdWZmZGlvX3pl
cm9wYWdlLnJhbmdlLnN0YXJ0LAo+ID4gKwlyZXQgPSB2YWxpZGF0ZV9yYW5nZShjdHgtPm1tLCAm
dWZmZGlvX3plcm9wYWdlLnJhbmdlLnN0YXJ0LAo+ID4gIAkJCSAgICAgdWZmZGlvX3plcm9wYWdl
LnJhbmdlLmxlbik7Cj4gPiAgCWlmIChyZXQpCj4gPiAgCQlnb3RvIG91dDsKPiA+IC0tIAo+ID4g
Mi4yMi4wLjQxMC5nZDhmZGJlMjFiNS1nb29nCgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
