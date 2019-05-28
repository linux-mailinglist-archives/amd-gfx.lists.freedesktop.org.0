Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1492DE73
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 15:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E096E31D;
	Wed, 29 May 2019 13:37:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2030F89D5B;
 Tue, 28 May 2019 23:33:47 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4SNT0LH119660;
 Tue, 28 May 2019 23:33:26 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2spxbq6a0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 May 2019 23:33:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4SNWSwv154312;
 Tue, 28 May 2019 23:33:26 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2sqh73cyk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 May 2019 23:33:25 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4SNXMjM008798;
 Tue, 28 May 2019 23:33:23 GMT
Received: from dhcp-10-65-132-79.vpn.oracle.com (/10.65.132.79)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 28 May 2019 16:33:22 -0700
Message-ID: <11193998209cc6ff34e7d704f081206b8787b174.camel@oracle.com>
Subject: Re: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
From: Khalid Aziz <khalid.aziz@oracle.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Andrew Murray
 <andrew.murray@arm.com>
Date: Tue, 28 May 2019 17:33:04 -0600
In-Reply-To: <20190528154057.GD32006@arrakis.emea.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
 <20190527143719.GA59948@MBP.local>
 <20190528145411.GA709@e119886-lin.cambridge.arm.com>
 <20190528154057.GD32006@arrakis.emea.arm.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=4
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905280148
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9271
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905280148
X-Mailman-Approved-At: Wed, 29 May 2019 13:37:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=corp-2018-07-02;
 bh=qZEaRDIPmwP5TWUCR9S3u/yLXWO2OSFxoldkS0AmjG0=;
 b=tXXK5WkvA3VpUTlG51P2q9LGfJkxovSGvJIwhPF0NNiu+pmrRrs643ObtsLlzxRZv9sL
 xGi67b35C30eA0gpzgCd7F8UFJTakd6EXWlodKDeKJ60hlPISFox2XuqHR9cIA7dhNTN
 Q5Lw2qFPToynBCudzAjqo23xQbAWky82hD/SJG6b8yHxFH/FmpNvWlBPdvbxfUAY8M+n
 Vx6af6q6yS6VUR4iO8Jx5PZrsb+QteyJjDVK43wT0JbTMcEcAMAf5nK5JLidAe2pkiIH
 EDCG69b49G78RsJVwupKHxQhnxG73NvIMsSpzN+lJa9ewDtd9ObQ1kGCJ+pwcgxn6TKn sg== 
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
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA1LTI4IGF0IDE2OjQwICswMTAwLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6
Cj4gT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDM6NTQ6MTFQTSArMDEwMCwgQW5kcmV3IE11cnJh
eSB3cm90ZToKPiA+IE9uIE1vbiwgTWF5IDI3LCAyMDE5IGF0IDAzOjM3OjIwUE0gKzAxMDAsIENh
dGFsaW4gTWFyaW5hcyB3cm90ZToKPiA+ID4gT24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDY6MzA6
NTFQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToKPiA+ID4gPiBUaGlzIHBhdGNoIGlz
IGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMgYXJtNjQga2VybmVsIEFCSQo+ID4gPiA+
IHRvIGFsbG93IHRvCj4gPiA+ID4gcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUg
dG9wIGJ5dGUgc2V0IHRvIHNvbWV0aGluZwo+ID4gPiA+IGVsc2Ugb3RoZXIKPiA+ID4gPiB0aGFu
IDB4MDApIGFzIHN5c2NhbGwgYXJndW1lbnRzLgo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgcGF0Y2gg
YWxsb3dzIHRhZ2dlZCBwb2ludGVycyB0byBiZSBwYXNzZWQgdG8gdGhlIGZvbGxvd2luZwo+ID4g
PiA+IG1lbW9yeQo+ID4gPiA+IHN5c2NhbGxzOiBicmssIGdldF9tZW1wb2xpY3ksIG1hZHZpc2Us
IG1iaW5kLCBtaW5jb3JlLCBtbG9jaywKPiA+ID4gPiBtbG9jazIsCj4gPiA+ID4gbW1hcCwgbW1h
cF9wZ29mZiwgbXByb3RlY3QsIG1yZW1hcCwgbXN5bmMsIG11bmxvY2ssIG11bm1hcCwKPiA+ID4g
PiByZW1hcF9maWxlX3BhZ2VzLCBzaG1hdCBhbmQgc2htZHQuCj4gPiA+ID4gCj4gPiA+ID4gVGhp
cyBpcyBkb25lIGJ5IHVudGFnZ2luZyBwb2ludGVycyBwYXNzZWQgdG8gdGhlc2Ugc3lzY2FsbHMg
aW4KPiA+ID4gPiB0aGUKPiA+ID4gPiBwcm9sb2d1ZXMgb2YgdGhlaXIgaGFuZGxlcnMuCj4gPiA+
ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBn
b29nbGUuY29tPgo+ID4gPiAKPiA+ID4gQWN0dWFsbHksIEkgZG9uJ3QgdGhpbmsgYW55IG9mIHRo
ZXNlIHdyYXBwZXJzIGdldCBjYWxsZWQgKGhhdmUKPiA+ID4geW91Cj4gPiA+IHRlc3RlZCB0aGlz
IHBhdGNoPykuIEZvbGxvd2luZyBjb21taXQgNDM3OGE3ZDRiZTMwICgiYXJtNjQ6Cj4gPiA+IGlt
cGxlbWVudAo+ID4gPiBzeXNjYWxsIHdyYXBwZXJzIiksIEkgdGhpbmsgd2UgaGF2ZSBvdGhlciBt
YWNybyBuYW1lcyBmb3IKPiA+ID4gb3ZlcnJpZGluZyB0aGUKPiA+ID4gc3lzXyogb25lcy4KPiA+
IAo+ID4gV2hhdCBpcyB0aGUgdmFsdWUgaW4gYWRkaW5nIHRoZXNlIHdyYXBwZXJzPwo+IAo+IE5v
dCBtdWNoIHZhbHVlLCBpbml0aWFsbHkgcHJvcG9zZWQganVzdCB0byBrZWVwIHRoZSBjb3JlIGNo
YW5nZXMKPiBzbWFsbC4KPiBJJ20gZmluZSB3aXRoIG1vdmluZyB0aGVtIGJhY2sgaW4gdGhlIGdl
bmVyaWMgY29kZSAoYnV0IHNlZSBiZWxvdykuCj4gCj4gSSB0aGluayBhbm90aGVyIGFzcGVjdCBp
cyBob3cgd2UgZGVmaW5lIHRoZSBBQkkuIElzIGFsbG93aW5nIHRhZ3MgdG8KPiBtbG9jaygpIGZv
ciBleGFtcGxlIHNvbWV0aGluZyBzcGVjaWZpYyB0byBhcm02NCBvciB3b3VsZCBzcGFyYyBBREkK
PiBuZWVkCj4gdGhlIHNhbWU/IEluIHRoZSBhYnNlbmNlIG9mIG90aGVyIGFyY2hpdGVjdHVyZXMg
ZGVmaW5pbmcgc3VjaCBBQkksIG15Cj4gcHJlZmVyZW5jZSB3b3VsZCBiZSB0byBrZWVwIHRoZSB3
cmFwcGVycyBpbiB0aGUgYXJjaCBjb2RlLgo+IAo+IEFzc3VtaW5nIHNwYXJjIHdvbid0IGltcGxl
bWVudCB1bnRhZ2dlZF9hZGRyKCksIHdlIGNhbiBwbGFjZSB0aGUKPiBtYWNyb3MKPiBiYWNrIGlu
IHRoZSBnZW5lcmljIGNvZGUgYnV0LCBhcyBwZXIgdGhlIHJldmlldyBoZXJlLCB3ZSBuZWVkIHRv
IGJlCj4gbW9yZQo+IHJlc3RyaWN0aXZlIG9uIHdoZXJlIHdlIGFsbG93IHRhZ2dlZCBhZGRyZXNz
ZXMuIEZvciBleGFtcGxlLCBpZgo+IG1tYXAoKQo+IGdldHMgYSB0YWdnZWQgYWRkcmVzcyB3aXRo
IE1BUF9GSVhFRCwgaXMgaXQgZXhwZWN0ZWQgdG8gcmV0dXJuIHRoZQo+IHRhZz8KCkkgd291bGQg
cmVjb21tZW5kIGFnYWluc3QgYW55IEFCSSBkaWZmZXJlbmNlcyBiZXR3ZWVuIEFSTTY0IE1URS9U
QkkgYW5kCnNwYXJjIEFESSB1bmxlc3MgaXQgc2ltcGx5IGNhbiBub3QgYmUgaGVscGVkLiBNeSB1
bmRlcnN0YW5kaW5nIG9mCk1URS9UQkkgaXMgbGltaXRlZCwgc28gSSB3aWxsIGV4cGxhaW4gaG93
IHNwYXJjIEFESSB3b3Jrcy4gT24gc3BhcmMsIGEKdGFnZ2VkIGFkZHJlc3MgaGFzIG5vIG1lYW5p
bmcgdW50aWwgZm9sbG93aW5nIHN0ZXBzIGhhcHBlbjoKCjEuIHNldCB0aGUgdXNlciBtb2RlIFBT
VEFURS5tY2RlIGJpdC4gVGhpcyBhY3RzIGFzIHRoZSBtYXN0ZXIgc3dpdGNoIHRvCmVuYWJsZSBB
REkgZm9yIGEgcHJvY2Vzcy4KCjIuIHNldCBUVEUubWNkIGJpdCBvbiBUTEIgZW50cmllcyB0aGF0
IG1hdGNoIHRoZSBhZGRyZXNzIHJhbmdlIEFESSBpcwpiZWluZyBlbmFibGVkIG9uLgoKMy4gU3Rv
cmUgdmVyc2lvbiB0YWcgZm9yIHRoZSByYW5nZSBvZiBhZGRyZXNzZXMgdXNlcnNwYWNlIHdhbnRz
IEFESQplbmFibGVkIG9uIHVzaW5nICJzdHhhIiBpbnN0cnVjdGlvbi4gVGhlc2UgdGFncyBhcmUg
c3RvcmVkIGluIHBoeXNpY2FsCm1lbW9yeSBieSB0aGUgbWVtb3J5IGNvbnRyb2xsZXIuCgpTdGVw
cyAxIGFuZCAyIGFyZSBhY2NvbXBsaXNoZWQgYnkgdXNlcnNwYWNlIGJ5IGNhbGxpbmcgbXByb3Rl
Y3QoKSB3aXRoClBST1RfQURJLiBUYWdzIGFyZSBzZXQgYnkgc3RvcmluZyB0YWdzIGluIGEgbG9v
cCwgZm9yIGV4YW1wbGU6CgogICAgICAgIHZlcnNpb24gPSAxMDsKICAgICAgICB0bXBfYWRkciA9
IHNobWFkZHI7CiAgICAgICAgZW5kID0gc2htYWRkciArIEJVRkZFUl9TSVpFOwogICAgICAgIHdo
aWxlICh0bXBfYWRkciA8IGVuZCkgewogICAgICAgICAgICAgICAgYXNtIHZvbGF0aWxlKAogICAg
ICAgICAgICAgICAgICAgICAgICAic3R4YSAlMSwgWyUwXTB4OTBcblx0IgogICAgICAgICAgICAg
ICAgICAgICAgICA6CiAgICAgICAgICAgICAgICAgICAgICAgIDogInIiICh0bXBfYWRkciksICJy
IiAodmVyc2lvbikpOwogICAgICAgICAgICAgICAgdG1wX2FkZHIgKz0gYWRpX2Jsa3N6OwogICAg
ICAgIH0KCldpdGggdGhlc2Ugc2VtYW50aWNzLCBnaXZpbmcgbW1hcCgpIG9yIHNoYW1hdCgpIGEg
dGFnZ2VkIGFkZHJlc3MgaXMKbWVhbmluZ2xlc3Mgc2luY2Ugbm8gdGFncyBoYXZlIGJlZW4gc3Rv
cmVkIGF0IHRoZSBhZGRyZXNzZXMgbW1hcCgpIHdpbGwKYWxsb2NhdGUgYW5kIG9uZSBjYW4gbm90
IHN0b3JlIHRhZ3MgYmVmb3JlIG1lbW9yeSByYW5nZSBoYXMgYmVlbgphbGxvY2F0ZWQuIElmIHdl
IGNob29zZSB0byBhbGxvdyB0YWdnZWQgYWRkcmVzc2VzIHRvIGNvbWUgaW50byBtbWFwKCkKYW5k
IHNobWF0KCksIHNwYXJjIGNvZGUgY2FuIHN0cmlwIHRoZSB0YWdzIHVuY29uZGl0aW9uYWxseSBh
bmQgdGhhdCBtYXkKaGVscCBzaW1wbGlmeSBBQkkgYW5kL29yIGNvZGUuCgo+IAo+IE15IHRob3Vn
aHRzIG9uIGFsbG93aW5nIHRhZ3MgKHF1aWNrIGxvb2spOgo+IAo+IGJyayAtIG5vCj4gZ2V0X21l
bXBvbGljeSAtIHllcwo+IG1hZHZpc2UgLSB5ZXMKPiBtYmluZCAtIHllcwo+IG1pbmNvcmUgLSB5
ZXMKPiBtbG9jaywgbWxvY2syLCBtdW5sb2NrIC0geWVzCj4gbW1hcCAtIG5vICh3ZSBtYXkgY2hh
bmdlIHRoaXMgd2l0aCBNVEUgYnV0IG5vdCBmb3IgVEJJKQo+IG1tYXBfcGdvZmYgLSBub3QgdXNl
ZCBvbiBhcm02NAo+IG1wcm90ZWN0IC0geWVzCj4gbXJlbWFwIC0geWVzIGZvciBvbGRfYWRkcmVz
cywgbm8gZm9yIG5ld19hZGRyZXNzIChvbiBwYXIgd2l0aCBtbWFwKQo+IG1zeW5jIC0geWVzCj4g
bXVubWFwIC0gcHJvYmFibHkgbm8gKG1tYXAgZG9lcyBub3QgcmV0dXJuIHRhZ2dlZCBwdHJzKQo+
IHJlbWFwX2ZpbGVfcGFnZXMgLSBubyAoYWxzbyBkZXByZWNhdGVkIHN5c2NhbGwpCj4gc2htYXQs
IHNobWR0IC0gc2hhbGwgd2UgYWxsb3cgdGFnZ2VkIGFkZHJlc3NlcyBvbiBzaGFyZWQgbWVtb3J5
Pwo+IAo+IFRoZSBhYm92ZSBpcyBvbmx5IGFib3V0IHRoZSBUQkkgQUJJIHdoaWxlIGlnbm9yaW5n
IGhhcmR3YXJlIE1URS4gRm9yCj4gdGhlCj4gbGF0dGVyLCB3ZSBtYXkgd2FudCB0byBjaGFuZ2Ug
dGhlIG1tYXAoKSB0byBhbGxvdyBwcmUtY29sb3VyaW5nIG9uCj4gcGFnZQo+IGZhdWx0IHdoaWNo
IG1lYW5zIHRoYXQgbXVubWFwKCkvbXByb3RlY3QoKSBzaG91bGQgYWxzbyBzdXBwb3J0IHRhZ2dl
ZAo+IHBvaW50ZXJzLiBQb3NzaWJseSBtcmVtYXAoKSBhcyB3ZWxsIGJ1dCB3ZSBuZWVkIHRvIGRl
Y2lkZSB3aGV0aGVyIGl0Cj4gc2hvdWxkIGFsbG93IHJlLWNvbG91cmluZyB0aGUgcGFnZSAocHJv
YmFibHkgbm8sIGluIHdoaWNoIGNhc2UKPiBvbGRfYWRkcmVzcyBhbmQgbmV3X2FkZHJlc3Mgc2hv
dWxkIGhhdmUgdGhlIHNhbWUgdGFnKS4gRm9yIHNvbWUgb2YKPiB0aGVzZQo+IHdlJ2xsIGVuZCB1
cCB3aXRoIGFybTY0IHNwZWNpZmljIHdyYXBwZXJzIGFnYWluLCB1bmxlc3Mgc3BhcmMgQURJCj4g
YWRvcHRzCj4gZXhhY3RseSB0aGUgc2FtZSBBQkkgcmVzdHJpY3Rpb25zLgo+IAoKTGV0IHVzIGtl
ZXAgYW55IHJlc3RyaWN0aW9ucyBjb21tb24gYWNyb3NzIEFSTTY0IGFuZCBzcGFyYy4gcHJlLQpj
b2xvcmluZyBvbiBzcGFyYyBpbiB0aGUga2VybmVsIHdvdWxkIG1lYW4ga2VybmVsIHdpbGwgaGF2
ZSB0byBleGVjdXRlCnN0eGEgaW5zdHJ1Y3Rpb25zIGluIGEgbG9vcCBmb3IgZWFjaCBwYWdlIGJl
aW5nIGZhdWx0ZWQgaW4uIE5vdCB0aGF0CmJpZyBhIGRlYWwgYnV0IGRvZXNuJ3QgdGhhdCBhc3N1
bWUgdGhlIGVudGlyZSBwYWdlIGhhcyB0aGUgc2FtZSB0YWcKd2hpY2ggaXMgZGVkY3VlZCBmcm9t
IHRoZSB1cHBlciBiaXRzIG9mIGFkZHJlc3M/IFNob3VsZG4ndCB3ZSBzdXBwb3J0CnRhZ3MgYXQg
dGhlIHNhbWUgZ3JhbnVsYXJpdHkgbGV2ZWwgYXMgd2hhdCB0aGUgaGFyZHdhcmUgc3VwcG9ydHM/
IFdlCndlbnQgdGhyb3VnaCB0aGlzIGRpc2N1c3Npb24gZm9yIHNwYXJjIGFuZCBkZWNpc2lvbiB3
YXMgdG8gc3VwcG9ydCB0YWdzCmF0IHRoZSBzYW1lIGdyYW51bGFyaXR5IGFzIGhhcmR3YXJlLiBU
aGF0IG1lYW5zIHdlIGNhbiBub3QgZGVkdWNlIHRhZ3MKZnJvbSB0aGUgZmlyc3QgYWRkcmVzcyB0
aGF0IHBpb2ludHMgaW50byBhbiBtbWFwIG9yIHNobWF0IHJlZ2lvbi4gVGhvc2UKdGFncyBhbmQg
dGhlIHVwcGVyIGJ5dGVzIG9mIGNvbG9yZWQgYWRkcmVzcyBjb3VsZCBjaGFuZ2UgZm9yIGV2ZXJ5
CmNhY2hlbGluZSBzaXplZCBibG9jayAoNjQtYnl0ZXMgb24gc3BhcmMgTTcpLiBXZSBjYW4gdHJ5
IHRvIHN0b3JlIHRhZ3MKZm9yIGFuIGVudGlyZSByZWdpb24gaW4gdm1hIGJ1dCB0aGF0IGlzIGV4
cGVuc2l2ZSwgcGx1cyBvbiBzcGFyYyB0YWdzCmFyZSBzZXQgaW4gdXNlcnNwYWNlIHdpdGggbm8g
cGFydGljaXBhdGlvbiBmcm9tIGtlcm5lbCBhbmQgbm93IHdlIG5lZWQKYSB3YXkgZm9yIHVzZXJz
cGFjZSB0byBjb21tdW5pY2F0ZSB0aGUgdGFncyB0byBrZXJuZWwuIEZyb20gc3BhcmMgcG9pbnQK
b2YgdmlldywgbWFraW5nIGtlcm5lbCByZXNwb25zaWJsZSBmb3IgYXNzaWduaW5nIHRhZ3MgdG8g
YSBwYWdlIG9uIHBhZ2UKZmF1bHQgaXMgZnVsbCBvZiBwaXRmYWxscy4KClRoYW5rcywKS2hhbGlk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
