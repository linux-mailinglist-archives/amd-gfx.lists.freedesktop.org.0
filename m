Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E82F30030
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2019 18:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9086E3A4;
	Thu, 30 May 2019 16:31:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897B36E3A0;
 Thu, 30 May 2019 16:06:37 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4UG4VBr062702;
 Thu, 30 May 2019 16:06:13 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2spw4ts5tq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 May 2019 16:06:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4UG64iQ193779;
 Thu, 30 May 2019 16:06:12 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2sr31vy3va-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 May 2019 16:06:12 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4UG62SZ026718;
 Thu, 30 May 2019 16:06:02 GMT
Received: from [192.168.1.16] (/24.9.64.241)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 30 May 2019 09:06:02 -0700
Subject: Re: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
To: Catalin Marinas <catalin.marinas@arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
 <20190527143719.GA59948@MBP.local>
 <20190528145411.GA709@e119886-lin.cambridge.arm.com>
 <20190528154057.GD32006@arrakis.emea.arm.com>
 <11193998209cc6ff34e7d704f081206b8787b174.camel@oracle.com>
 <20190529142008.5quqv3wskmpwdfbu@mbp>
 <b2753e81-7b57-481f-0095-3c6fecb1a74c@oracle.com>
 <20190530151105.GA35418@arrakis.emea.arm.com>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <f79336b5-46b4-39c0-b754-23366207e32d@oracle.com>
Date: Thu, 30 May 2019 10:05:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190530151105.GA35418@arrakis.emea.arm.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9272
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=660
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905300114
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9272
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=684 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905300114
X-Mailman-Approved-At: Thu, 30 May 2019 16:31:06 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=+GLA6qLrn26KPJEpEajh3ipF/BPoxxfouik/rd34OzM=;
 b=AwmlutIReVoUCST+0CvuT1i683wuk/bgaVaXpwFLuLObOH6WAfasg+1gIzeRdE2lXYjb
 k8P67eGtLM2jUaKR9Cy3m4TvgSb5+cBwa2T8P+yN1HdMoZWh+Ggt2lVsYNq8wgS4RczC
 Ob71kUfljvyH5fcGoqQaqFQS4TYWXfMx3pY3C+r2yQF46AIqpx1jAW7P3kPlizYiO3T0
 ZblzYxr+PrepeLcYjU1orVLKF6nQOQcaFQBGNaPWrM8vzs9svllGt0RN7sK/lmLWd9+b
 VLJpczb5tPtPCsmplNczUgngjT1jT/8Yk0IfRgeZkTSIRA/aLnoWnZFsdY3idrib592i Ow== 
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
 Christian Koenig <Christian.Koenig@amd.com>,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Lee Smith <Lee.Smith@arm.com>, linux-kselftest@vger.kernel.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Murray <andrew.murray@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNS8zMC8xOSA5OjExIEFNLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gT24gV2VkLCBNYXkg
MjksIDIwMTkgYXQgMDE6MTY6MzdQTSAtMDYwMCwgS2hhbGlkIEF6aXogd3JvdGU6Cj4+IG1tYXAo
KSBjYW4gcmV0dXJuIHRoZSBzYW1lIHRhZ2dlZCBhZGRyZXNzIGJ1dCBJIGFtIHVuZWFzeSBhYm91
dCBrZXJuZWwKPj4gcHJlLWNvbG9yaW5nIHRoZSBwYWdlcy4gRGF0YWJhc2UgY2FuIG1tYXAgMTAw
J3Mgb2YgR0Igb2YgbWVtb3J5LiBUaGF0IGlzCj4+IGxvdCBvZiB3b3JrIGJlaW5nIG9mZmxvYWRl
ZCB0byB0aGUga2VybmVsIHRvIHByZS1jb2xvciB0aGUgcGFnZSBldmVuIGlmCj4+IGRvbmUgaW4g
YmF0Y2hlcyBhcyBwYWdlcyBhcmUgZmF1bHRlZCBpbi4KPiAKPiBGb3IgYW5vbnltb3VzIG1tYXAo
KSBmb3IgZXhhbXBsZSwgdGhlIGtlcm5lbCB3b3VsZCBoYXZlIHRvIHplcm8gdGhlCj4gZmF1bHRl
ZCBpbiBwYWdlcyBhbnl3YXkuIFdlIGNhbiBoYW5kbGUgdGhlIGNvbG91cmluZyBhdCB0aGUgc2Ft
ZSB0aW1lIGluCj4gY2xlYXJfdXNlcl9wYWdlKCkgKGFzIEkgc2FpZCBiZWxvdywgd2UgaGF2ZSB0
byBjbGVhciB0aGUgY29sb3VyIGFueXdheQo+IGZyb20gcHJldmlvdXMgdXNlcywgc28gaXQncyBz
aW1wbHkgZXh0ZW5kaW5nIHRoaXMgdG8gc3VwcG9ydCBzb21ldGhpbmcKPiBvdGhlciB0aGFuIHRh
Zy9jb2xvdXIgMCBieSBkZWZhdWx0IHdpdGggbm8gYWRkaXRpb25hbCBvdmVyaGVhZCkuCj4gCgpP
biBzcGFyYyBNNywgY2xlYXJfdXNlcl9wYWdlKCkgZW5kcyB1cCBpbiBNN2NsZWFyX3VzZXJfcGFn
ZSBkZWZpbmVkIGluCmFyY2gvc3BhcmMvbGliL003bWVtc2V0LlMuIE03IGNvZGUgdXNlIEJsb2Nr
IEluaXQgU3RvcmUgKEJJUykgdG8gY2xlYXIKdGhlIHBhZ2UuIEJJUyBvbiBNNyBjbGVhcnMgdGhl
IG1lbW9yeSB0YWdzIGFzIHdlbGwgYW5kIG5vIHNlcGFyYXRlCmluc3RydWN0aW9ucyBhcmUgbmVl
ZGVkIHRvIGNsZWFyIHRoZSB0YWdzLiBBcyBhIHJlc3VsdCB3aGVuIGtlcm5lbApjbGVhcnMgYSBw
YWdlIGJlZm9yZSByZXR1cm5pbmcgaXQgdG8gdXNlciwgdGhlIHBhZ2UgaXMgbm90IG9ubHkgemVy
b2VkCm91dCwgaXRzIHRhZ3MgYXJlIGFsc28gY2xlYXJlZCB0byAwLgoKPj4+IFNpbmNlIHdlIGFs
cmVhZHkgbmVlZCBzdWNoIGxvb3AgaW4gdGhlIGtlcm5lbCwgd2UgbWlnaHQgYXMgd2VsbCBhbGxv
dwo+Pj4gdXNlciBzcGFjZSB0byByZXF1aXJlIGEgY2VydGFpbiBjb2xvdXIuIFRoaXMgY29tZXMg
aW4gaGFuZHkgZm9yIGxhcmdlCj4+PiBtYWxsb2MoKSBhbmQgYW5vdGhlciBhZHZhbnRhZ2UgaXMg
dGhhdCB0aGUgQyBsaWJyYXJ5IHdvbid0IGJlIHN0dWNrCj4+PiB0cnlpbmcgdG8gcGFpbnQgdGhl
IHdob2xlIHJhbmdlICh0aGluayBHQikuCj4+Cj4+IElmIGtlcm5lbCBpcyBnb2luZyB0byBwcmUt
Y29sb3IgYWxsIHBhZ2VzIGluIGEgdm1hLCB3ZSB3aWxsIG5lZWQgdG8KPj4gc3RvcmUgdGhlIGRl
ZmF1bHQgdGFnIGluIHRoZSB2bWEuIEl0IHdpbGwgYWRkIG1vcmUgdGltZSB0byBwYWdlIGZhdWx0
Cj4+IGhhbmRsaW5nIGNvZGUuIE9uIHNwYXJjIE03LCBrZXJuZWwgd2lsbCBuZWVkIHRvIGV4ZWN1
dGUgYWRkaXRpb25hbCAxMjgKPj4gc3R4YSBpbnN0cnVjdGlvbnMgdG8gc2V0IHRoZSB0YWdzIG9u
IGEgbm9ybWFsIHBhZ2UuCj4gCj4gQXMgSSBzYWlkLCBzaW5jZSB0aGUgdXNlciBjYW4gcmV0cmll
dmUgYW4gb2xkIGNvbG91ciB1c2luZyBsZHhhLCB0aGUKPiBrZXJuZWwgc2hvdWxkIHBlcmZvcm0g
dGhpcyBvcGVyYXRpb24gYW55d2F5IG9uIGFueSBuZXdseSBhbGxvY2F0ZWQgcGFnZQo+ICh1bmxl
c3MgeW91IGNsZWFyIHRoZSBleGlzdGluZyBjb2xvdXIgb24gcGFnZSBmcmVlaW5nKS4+CgpUYWdz
IGFyZSBub3QgY2xlYXJlZCBvbiBzcGFyYyBvbiBmcmVlaW5nLiBUaGV5IGdldCBjbGVhcmVkIHdo
ZW4gdGhlIHBhZ2UKaXMgYWxsb2NhdGVkIGFnYWluLgoKPj4+PiBXZSBjYW4gdHJ5IHRvIHN0b3Jl
IHRhZ3MgZm9yIGFuIGVudGlyZSByZWdpb24gaW4gdm1hIGJ1dCB0aGF0IGlzCj4+Pj4gZXhwZW5z
aXZlLCBwbHVzIG9uIHNwYXJjIHRhZ3MgYXJlIHNldCBpbiB1c2Vyc3BhY2Ugd2l0aCBubwo+Pj4+
IHBhcnRpY2lwYXRpb24gZnJvbSBrZXJuZWwgYW5kIG5vdyB3ZSBuZWVkIGEgd2F5IGZvciB1c2Vy
c3BhY2UgdG8KPj4+PiBjb21tdW5pY2F0ZSB0aGUgdGFncyB0byBrZXJuZWwuCj4+Pgo+Pj4gV2Ug
Y2FuJ3Qgc3VwcG9ydCBmaW5lciBncmFudWxhcml0eSB0aHJvdWdoIHRoZSBtbWFwKCkgc3lzY2Fs
bCBhbmQsIGFzCj4+PiB5b3Ugc2FpZCwgdGhlIHZtYSBpcyBub3QgdGhlIHJpZ2h0IHRoaW5nIHRv
IHN0b3JlIHRoZSBpbmRpdmlkdWFsIHRhZ3MuCj4+PiBXaXRoIHRoZSBhYm92ZSBleHRlbnNpb24g
dG8gbW1hcCgpLCB3ZSdkIGhhdmUgdG8gc3RvcmUgYSBjb2xvdXIgcGVyIHZtYQo+Pj4gYW5kIHBy
ZXZlbnQgbWVyZ2luZyBpZiBkaWZmZXJlbnQgY29sb3VycyAod2UgY291bGQgYXMgd2VsbCB1c2Ug
dGhlCj4+PiBwa2V5cyBtZWNoYW5pc20gd2UgYWxyZWFkeSBoYXZlIGluIHRoZSBrZXJuZWwgYnV0
IHVzZSBhIGNvbG91ciBwZXIgdm1hCj4+PiBpbnN0ZWFkIG9mIGEga2V5KS4KPj4KPj4gU2luY2Ug
dGFncyBjYW4gY2hhbmdlIG9uIGFueSBwYXJ0IG9mIG1tYXAgcmVnaW9uIG9uIHNwYXJjIGF0IGFu
eSB0aW1lCj4+IHdpdGhvdXQga2VybmVsIGJlaW5nIGludm9sdmVkLCBJIGFtIG5vdCBzdXJlIEkg
c2VlIG11Y2ggcmVhc29uIGZvcgo+PiBrZXJuZWwgdG8gZW5mb3JjZSBhbnkgdGFnIHJlbGF0ZWQg
cmVzdHJpY3Rpb25zLgo+IAo+IEl0J3Mgbm90IGVuZm9yY2luZyBhIHRhZywgbW9yZSBsaWtlIHRo
ZSBkZWZhdWx0IGNvbG91ciBmb3IgYSBmYXVsdGVkIGluCj4gcGFnZS4gQW55d2F5LCBpZiBzcGFy
YyBpcyBnb2luZyB3aXRoIGRlZmF1bHQgMC91bnRhZ2dlZCwgdGhhdCdzIGZpbmUgYXMKPiB3ZWxs
LiBXZSBtYXkgYWRkIHRoaXMgbW1hcCgpIG9wdGlvbiB0byBhcm02NCBvbmx5Lgo+IAo+Pj4+IEZy
b20gc3BhcmMgcG9pbnQgb2YgdmlldywgbWFraW5nIGtlcm5lbCByZXNwb25zaWJsZSBmb3IgYXNz
aWduaW5nIHRhZ3MKPj4+PiB0byBhIHBhZ2Ugb24gcGFnZSBmYXVsdCBpcyBmdWxsIG9mIHBpdGZh
bGxzLgo+Pj4KPj4+IFRoaXMgY291bGQgYmUganVzdCBzb21lIGFybTY0LXNwZWNpZmljIGJ1dCBp
ZiB5b3UgcGxhbiB0byBkZXBsb3kgaXQgbW9yZQo+Pj4gZ2VuZXJpY2FsbHkgZm9yIHNwYXJjIChh
dCB0aGUgQyBsaWJyYXJ5IGxldmVsKSwgeW91IG1heSBmaW5kIHRoaXMKPj4+IHVzZWZ1bC4KPj4K
Pj4gQ29tbW9uIHNlbWFudGljcyBmcm9tIGFwcCBkZXZlbG9wZXIgcG9pbnQgb2YgdmlldyB3aWxs
IGJlIHZlcnkgdXNlZnVsIHRvCj4+IG1haW50YWluLiBJZiBhcm02NCBzYXlzIG1tYXAgd2l0aCBN
QVBfRklYRUQgYW5kIGEgdGFnZ2VkIGFkZHJlc3Mgd2lsbAo+PiByZXR1cm4gYSBwcmUtY29sb3Jl
ZCBwYWdlLCBJIHdvdWxkIHJhdGhlciBoYXZlIGl0IGJlIHRoZSBzYW1lIG9uIGFueQo+PiBhcmNo
aXRlY3R1cmUuIElzIHRoZXJlIGEgdXNlIGNhc2UgdGhhdCBqdXN0aWZpZXMga2VybmVsIGRvaW5n
IHRoaXMgZXh0cmEKPj4gd29yaz8KPiAKPiBTbyBpZiBhIGRhdGFiYXNlIHByb2dyYW0gaXMgZG9p
bmcgYW4gYW5vbnltb3VzIG1tYXAoUFJPVF9UQkkpIG9mIDEwMEdCLAo+IElJVUMgZm9yIHNwYXJj
IHRoZSBmYXVsdGVkLWluIHBhZ2VzIHdpbGwgaGF2ZSByYW5kb20gY29sb3VycyAob24gNjQtYnl0
ZQo+IGdyYW51bGFyaXR5KS4gSWdub3JpbmcgdGhlIGluZm9ybWF0aW9uIGxlYWsgZnJvbSBwcmlv
ciB1c2VzIG9mIHN1Y2gKPiBwYWdlcywgaXQgd291bGQgYmUgdGhlIHJlc3BvbnNpYmlsaXR5IG9m
IHRoZSBkYiBwcm9ncmFtIHRvIGlzc3VlIHRoZQo+IHN0eGEuIE9uIGFybTY0LCBzaW5jZSB3ZSBh
bHNvIHdhbnQgdG8gZG8gdGhpcyB2aWEgbWFsbG9jKCksIGFueSBsYXJnZQo+IGFsbG9jYXRpb24g
d291bGQgcmVxdWlyZSBhbGwgcGFnZXMgdG8gYmUgZmF1bHRlZCBpbiBzbyB0aGF0IG1hbGxvYygp
IGNhbgo+IHNldCB0aGUgd3JpdGUgY29sb3VyIGJlZm9yZSBiZWluZyBoYW5kZWQgb3ZlciB0byB0
aGUgdXNlci4gVGhhdCdzIHdoYXQKPiB3ZSB3YW50IHRvIGF2b2lkIGFuZCB0aGUgdXNlciBpcyBm
cmVlIHRvIHJlcGFpbnQgdGhlIG1lbW9yeSBhcyBpdCBsaWtlcy4KPiAKCk9uIHNwYXJjLCBhbnkg
bmV3bHkgYWxsb2NhdGVkIHBhZ2UgaXMgY2xlYXJlZCBhbG9uZyB3aXRoIGFueSBvbGQgdGFncyBv
bgppdC4gU2luY2UgY2xlYXJpbmcgdGFnIGhhcHBlbnMgYXV0b21hdGljYWxseSB3aGVuIHBhZ2Ug
aXMgY2xlYXJlZCBvbgpzcGFyYywgY2xlYXJfdXNlcl9wYWdlKCkgd2lsbCBuZWVkIHRvIGV4ZWN1
dGUgYWRkaXRpb25hbCBzdHhhCmluc3RydWN0aW9ucyB0byBzZXQgYSBuZXcgdGFnLiBJdCBpcyBk
b2FibGUuIEluIGEgd2F5IGl0IGlzIGRvbmUgYWxyZWFkeQppZiBwYWdlIGlzIGJlaW5nIHByZS1j
b2xvcmVkIHdpdGggdGFnIDAgYWx3YXlzIDspIFdoZXJlIHdvdWxkIHRoZQpwcmUtZGVmaW5lZCB0
YWcgYmUgc3RvcmVkIC0gYXMgcGFydCBvZiBhZGRyZXNzIHN0b3JlZCBpbiB2bV9zdGFydCBvciBh
Cm5ldyBmaWVsZCBpbiB2bV9hcmVhX3N0cnVjdD8KCi0tCktoYWxpZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
