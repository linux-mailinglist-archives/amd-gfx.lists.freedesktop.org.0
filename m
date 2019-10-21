Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3E1DF5BE
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 21:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC5C6E222;
	Mon, 21 Oct 2019 19:12:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320BB6E1E0
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 19:12:07 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-UXHEnR14P7SpLJiLYXvamA-1; Mon, 21 Oct 2019 15:12:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 606B047B;
 Mon, 21 Oct 2019 19:12:00 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 153B060856;
 Mon, 21 Oct 2019 19:11:59 +0000 (UTC)
Date: Mon, 21 Oct 2019 15:11:57 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH hmm 02/15] mm/mmu_notifier: add an interval tree notifier
Message-ID: <20191021191157.GA5208@redhat.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <20191015181242.8343-3-jgg@ziepe.ca>
 <20191021183056.GA3177@redhat.com>
 <20191021185421.GG6285@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20191021185421.GG6285@mellanox.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: UXHEnR14P7SpLJiLYXvamA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571685125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fkpSHvtoZdBJ93HK32BxiBlNAsoJFLpFKE8eiNsK3LE=;
 b=XoviMv8Ki8LkN/Jhz6UXYkxfSQthg4DBnTDSYrWmY6FPFQY/ttcubKjIPT2rkWtMhFjvgs
 Fyh+qdoYYxecryolwJcEf0xjaB/xlO/2uTW/fwAOBuULArgeY4oMUorcjIGsDTJ6V4qBnQ
 8D7k5WaGBmxLQ2hPu+z6OL7fO1+ms+U=
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDY6NTQ6MjVQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDAyOjMwOjU2UE0gLTA0MDAsIEplcm9t
ZSBHbGlzc2Ugd3JvdGU6Cj4gCj4gPiA+ICsvKioKPiA+ID4gKyAqIG1tdV9yYW5nZV9yZWFkX3Jl
dHJ5IC0gRW5kIGEgcmVhZCBzaWRlIGNyaXRpY2FsIHNlY3Rpb24gYWdhaW5zdCBhIFZBIHJhbmdl
Cj4gPiA+ICsgKiBtcm46IFRoZSByYW5nZSB1bmRlciBsb2NrCj4gPiA+ICsgKiBzZXE6IFRoZSBy
ZXR1cm4gb2YgdGhlIHBhaXJlZCBtbXVfcmFuZ2VfcmVhZF9iZWdpbigpCj4gPiA+ICsgKgo+ID4g
PiArICogVGhpcyBNVVNUIGJlIGNhbGxlZCB1bmRlciBhIHVzZXIgcHJvdmlkZWQgbG9jayB0aGF0
IGlzIGFsc28gaGVsZAo+ID4gPiArICogdW5jb25kaXRpb25hbGx5IGJ5IG9wLT5pbnZhbGlkYXRl
KCkuIFRoYXQgbG9jayBwcm92aWRlcyB0aGUgcmVxdWlyZWQgU01QCj4gPiA+ICsgKiBiYXJyaWVy
IGZvciBoYW5kbGluZyBpbnZhbGlkYXRlX3NlcS4KPiA+ID4gKyAqCj4gPiA+ICsgKiBFYWNoIGNh
bGwgc2hvdWxkIGJlIHBhaXJlZCB3aXRoIGEgc2luZ2xlIG1tdV9yYW5nZV9yZWFkX2JlZ2luKCkg
YW5kCj4gPiA+ICsgKiBzaG91bGQgYmUgdXNlZCB0byBjb25jbHVkZSB0aGUgcmVhZCBzaWRlLgo+
ID4gPiArICoKPiA+ID4gKyAqIFJldHVybnMgdHJ1ZSBpZiBhbiBpbnZhbGlkYXRpb24gY29sbGlk
ZWQgd2l0aCB0aGlzIGNyaXRpY2FsIHNlY3Rpb24sIGFuZAo+ID4gPiArICogdGhlIGNhbGxlciBz
aG91bGQgcmV0cnkuCj4gPiA+ICsgKi8KPiA+ID4gK3N0YXRpYyBpbmxpbmUgYm9vbCBtbXVfcmFu
Z2VfcmVhZF9yZXRyeShzdHJ1Y3QgbW11X3JhbmdlX25vdGlmaWVyICptcm4sCj4gPiA+ICsJCQkJ
CXVuc2lnbmVkIGxvbmcgc2VxKQo+ID4gPiArewo+ID4gPiArCXJldHVybiBSRUFEX09OQ0UobXJu
LT5pbnZhbGlkYXRlX3NlcSkgIT0gc2VxOwo+ID4gPiArfQo+ID4gCj4gPiBXaGF0IGFib3V0IGNh
bGxpbmcgdGhpcyBtbXVfcmFuZ2VfcmVhZF9lbmQoKSBpbnN0ZWFkID8gVG8gbWF0Y2gKPiA+IHdp
dGggdGhlIG1tdV9yYW5nZV9yZWFkX2JlZ2luKCkuCj4gCj4gX2VuZCBtYWtlIHNvbWUgc2Vuc2Ug
dG9vLCBidXQgSSBwaWNrZWQgX3JldHJ5IGZvciBzeW1tZXRyeSB3aXRoIHRoZQo+IHNlcWNvdW50
XyogZmFtaWx5IG9mIGZ1bmN0aW9ucyB3aGljaCB1c2VkIHJldHJ5Lgo+IAo+IEkgdGhpbmsgcmV0
cnkgbWFrZXMgaXQgY2xlYXJlciB0aGF0IGl0IGlzIGV4cGVjdGVkIHRvIGZhaWwgYW5kIHJldHJ5
Cj4gaXMgcmVxdWlyZWQuCgpGYWlyIGVub3VnaC4KCj4gCj4gPiA+ICsJLyoKPiA+ID4gKwkgKiBU
aGUgaW52X2VuZCBpbmNvcnBvcmF0ZXMgYSBkZWZlcnJlZCBtZWNoYW5pc20gbGlrZSBydG5sLiBB
ZGRzIGFuZAo+ID4gCj4gPiBUaGUgcnRubCByZWZlcmVuY2UgaXMgbG9zdCBvbiBwZW9wbGUgdW5m
YW1pbGlhciB3aXRoIHRoZSBuZXR3b3JrIDopCj4gPiBjb2RlIG1heWJlIGxpa2UgcnRubF9sb2Nr
KCkvcnRubF91bmxvY2soKSBzbyBwZW9wbGUgaGF2ZSBhIGNoYW5jZSB0bwo+ID4gZ3JlcCB0aGUg
cmlnaHQgZnVuY3Rpb24uIEFzc3VtaW5nIGkgYW0gbXlzZWxmIGdldHRpbmcgdGhlIHJpZ2h0Cj4g
PiByZWZlcmVuY2UgOikKPiAKPiBZZXAsIHlvdSBnb3QgaXQsIEkgd2lsbCB1cGRhdGUKPiAKPiA+
ID4gKwkvKgo+ID4gPiArCSAqIG1ybi0+aW52YWxpZGF0ZV9zZXEgaXMgYWx3YXlzIHNldCB0byBh
biBvZGQgdmFsdWUuIFRoaXMgZW5zdXJlcwo+ID4gPiArCSAqIHRoYXQgaWYgc2VxIGRvZXMgd3Jh
cCB3ZSB3aWxsIGFsd2F5cyBjbGVhciB0aGUgYmVsb3cgc2xlZXAgaW4gc29tZQo+ID4gPiArCSAq
IHJlYXNvbmFibGUgdGltZSBhcyBtbW5fbW0tPmludmFsaWRhdGVfc2VxIGlzIGV2ZW4gaW4gdGhl
IGlkbGUKPiA+ID4gKwkgKiBzdGF0ZS4KPiA+IAo+ID4gSSB0aGluayB0aGlzIGNvbW1lbnQgc2hv
dWxkIGJlIHdpdGggdGhlIHN0cnVjdCBtbXVfcmFuZ2Vfbm90aWZpZXIKPiA+IGRlZmluaXRpb24g
YW5kIHlvdSBzaG91bGQganVzdCBwb2ludCB0byBpdCBmcm9tIGhlcmUgYXMgdGhlIHNhbWUKPiA+
IGNvbW1lbnQgd291bGQgYmUgdXNlZnVsIGRvd24gYmVsb3cuCj4gCj4gSSBoYWQgaXQgaGVyZSBi
ZWNhdXNlIGl0IGlzIGNyaXRpY2FsIHRvIHVuZGVyc3RhbmRpbmcgdGhlIHdhaXRfZXZlbnQKPiBh
bmQgd2h5IGl0IGRvZXNuJ3QganVzdCBibG9jayBpbmRlZmluaXRlbHksIGJ1dCB5ZXMgdGhpcyBw
cm9wZXJ0eQo+IGNvbWVzIHVwIGJlbG93IHRvbyB3aGljaCByZWZlcnMgYmFjayBoZXJlLgo+IAo+
IEZ1bmRhbWVudGFsbHkgdGhpcyB3YWl0IGV2ZW50IGlzIHdoeSB0aGlzIGFwcHJvYWNoIHRvIGtl
ZXAgYW4gb2RkCj4gdmFsdWUgaW4gdGhlIG1ybiBpcyB1c2VkLgoKVGhlIGNvbW1lbnQgaXMgZmlu
ZSwgaXQgaXMganVzdCBpIHJlYWQgdGhlIHBhdGNoIG91dCBvZiBvcmRlciBhbmQKaW4gaW5zZXJ0
IGZ1bmN0aW9uIGkgd2FzIHBvbmRlcmluZyBvbiB3aHkgaXQgbXVzdCBiZSBvZGQgd2hpbGUgdGhl
CmV4cGxhbmF0aW9uIHdhcyBoZXJlLiBJdCBpcyBtb3JlIGEgdGFzdGUgdGhpbmcsIGkgcHJlZmVy
IGNvbW1lbnRzCmFib3V0IHRoaXMgdG8gYmUgcGFydCBvZiB0aGUgc3RydWN0IGRlZmluaXRpb24g
Y29tbWVudHMgc28gdGhhdAptdWx0aXBsZSBwbGFjZSBjYW4gcmVmZXIgdG8gdGhlIHNhbWUgc3Ry
dWN0IGRlZmluaXRpb24gaXQgaXMgbW9yZQpyZXNpbGlhbnQgdG8gY29kZSBjaGFuZ2UgYXMgc3Ry
dWN0IGRlZmluaXRpb24gaXMgYWx3YXlzIGVhc3kgdG8KZmluZCBhbmQgdGh1cyByZWZlcmVuY2Ug
dG8gaXQgY2FuIGJlIHNwcmlua2xlIGFsbCBvdmVyIHdoZXJlIGl0IGlzCm5lY2Vzc2FyeS4KCgo+
IAo+ID4gPiAtaW50IF9fbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoc3RydWN0
IG1tdV9ub3RpZmllcl9yYW5nZSAqcmFuZ2UpCj4gPiA+ICtzdGF0aWMgaW50IG1uX2l0cmVlX2lu
dmFsaWRhdGUoc3RydWN0IG1tdV9ub3RpZmllcl9tbSAqbW1uX21tLAo+ID4gPiArCQkJCSAgICAg
Y29uc3Qgc3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSAqcmFuZ2UpCj4gPiA+ICt7Cj4gPiA+ICsJ
c3RydWN0IG1tdV9yYW5nZV9ub3RpZmllciAqbXJuOwo+ID4gPiArCXVuc2lnbmVkIGxvbmcgY3Vy
X3NlcTsKPiA+ID4gKwo+ID4gPiArCWZvciAobXJuID0gbW5faXRyZWVfaW52X3N0YXJ0X3Jhbmdl
KG1tbl9tbSwgcmFuZ2UsICZjdXJfc2VxKTsgbXJuOwo+ID4gPiArCSAgICAgbXJuID0gbW5faXRy
ZWVfaW52X25leHQobXJuLCByYW5nZSkpIHsKPiA+ID4gKwkJYm9vbCByZXQ7Cj4gPiA+ICsKPiA+
ID4gKwkJV1JJVEVfT05DRShtcm4tPmludmFsaWRhdGVfc2VxLCBjdXJfc2VxKTsKPiA+ID4gKwkJ
cmV0ID0gbXJuLT5vcHMtPmludmFsaWRhdGUobXJuLCByYW5nZSk7Cj4gPiA+ICsJCWlmICghcmV0
ICYmICFXQVJOX09OKG1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUocmFuZ2UpKSkKPiA+IAo+
ID4gSXNuJ3QgdGhlIGxvZ2ljIHdyb25nIGhlcmUgPyBXZSB3YW50IHRvIHdhcm4gaWYgdGhlIHJh
bmdlCj4gPiB3YXMgbWFyayBhcyBibG9ja2FibGUgYW5kIGludmFsaWRhdGUgcmV0dXJuZWQgZmFs
c2UuIEFsc28KPiA+IHdlIHdlbnQgdG8gYmFja29mZiBubyBtYXR0ZXIgd2hhdCBpZiB0aGUgaW52
YWxpZGF0ZSByZXR1cm4KPiA+IGZhbHNlIGllOgo+IAo+IElmIGludmFsaWRhdGUgcmV0dXJuZWQg
ZmFsc2UgYW5kIHRoZSBjYWxsZXIgaXMgYmxvY2thYmxlIHRoZW4gd2UgZG8KPiBub3Qgd2FudCB0
byByZXR1cm4sIHdlIG11c3QgY29udGludWUgcHJvY2Vzc2luZyBvdGhlciByYW5nZXMgLSB0byB0
cnkKPiB0byBjb3BlIHdpdGggdGhlIGRlZmVjdGl2ZSBkcml2ZXIuCj4gCj4gQ2FsbGVycyBpbiBi
bG9ja2luZyBtb2RlIGlnbm9yZSB0aGUgcmV0dXJuIHZhbHVlIGFuZCBnbyBhaGVhZCB0bwo+IGlu
dmFsaWRhdGUuLgo+IAo+IFdvdWxkIGl0IGJlIGNsZWFyZXIgYXMgCj4gCj4gaWYgKCFyZXQpIHsK
PiAgICBpZiAoV0FSTl9PTihtbXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHJhbmdlKSkpCj4g
ICAgICAgIGNvbnRpbnVlOwo+ICAgIGdvdG8gb3V0X3dvdWxkX2Jsb2NrOwo+IH0KPiAKPiA/CgpZ
ZXMgbG9vayBjbGVhcmVyIHRvIG1lIGF0IGxlYXN0LgoKPiAKPiA+ID4gQEAgLTI4NCwyMSArNTg5
LDIyIEBAIGludCBfX21tdV9ub3RpZmllcl9yZWdpc3RlcihzdHJ1Y3QgbW11X25vdGlmaWVyICpt
biwgc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gPiA+ICAJCSAqIHRoZSB3cml0ZSBzaWRlIG9mIHRo
ZSBtbWFwX3NlbS4KPiA+ID4gIAkJICovCj4gPiA+ICAJCW1tdV9ub3RpZmllcl9tbSA9Cj4gPiA+
IC0JCQlrbWFsbG9jKHNpemVvZihzdHJ1Y3QgbW11X25vdGlmaWVyX21tKSwgR0ZQX0tFUk5FTCk7
Cj4gPiA+ICsJCQlremFsbG9jKHNpemVvZihzdHJ1Y3QgbW11X25vdGlmaWVyX21tKSwgR0ZQX0tF
Uk5FTCk7Cj4gPiA+ICAJCWlmICghbW11X25vdGlmaWVyX21tKQo+ID4gPiAgCQkJcmV0dXJuIC1F
Tk9NRU07Cj4gPiA+ICAKPiA+ID4gIAkJSU5JVF9ITElTVF9IRUFEKCZtbXVfbm90aWZpZXJfbW0t
Pmxpc3QpOwo+ID4gPiAgCQlzcGluX2xvY2tfaW5pdCgmbW11X25vdGlmaWVyX21tLT5sb2NrKTsK
PiA+ID4gKwkJbW11X25vdGlmaWVyX21tLT5pbnZhbGlkYXRlX3NlcSA9IDI7Cj4gPiAKPiA+IFdo
eSBzdGFydGluZyBhdCAyID8KPiAKPiBHb29kIHF1ZXN0aW9uLiBJZiBldmVyeXRoaW5nIGlzIGNv
ZGVkIHByb3Blcmx5IHRoZSBzdGFydGluZyB2YWx1ZQo+IGRvZXNuJ3QgbWF0dGVyCj4gCj4gSSBs
ZWZ0IGl0IGxpa2UgdGhpcyBiZWNhdXNlIGl0IG1ha2VzIGRlYnVnZ2luZyBhIHRpbnkgYml0IHNp
bXBsZXIsIGllCj4gaWYgeW91IHByaW50IHRoZSBzZXEgbnVtYmVyIHRoZW4gdGhlIGZpcnN0IG1t
dV9yYW5nZV9ub3RpZmlmZXJzIHdpbGwKPiBnZXQgMSBhcyB0aGVpciBpbnRpYWwgc2VxIChzZWUg
X19tbXVfcmFuZ2Vfbm90aWZpZXJfaW5zZXJ0KSBpbnN0ZWFkIG9mCj4gVUxPTkdfTUFYCgpZZWFo
IG1ha2Ugc2Vuc2UuCgo+IAo+ID4gPiArCQltbXVfbm90aWZpZXJfbW0tPml0cmVlID0gUkJfUk9P
VF9DQUNIRUQ7Cj4gPiA+ICsJCWluaXRfd2FpdHF1ZXVlX2hlYWQoJm1tdV9ub3RpZmllcl9tbS0+
d3EpOwo+ID4gPiArCQlJTklUX0hMSVNUX0hFQUQoJm1tdV9ub3RpZmllcl9tbS0+ZGVmZXJyZWRf
bGlzdCk7Cj4gPiA+ICAJfQo+ID4gPiAgCj4gPiA+ICAJcmV0ID0gbW1fdGFrZV9hbGxfbG9ja3Mo
bW0pOwo+ID4gPiAgCWlmICh1bmxpa2VseShyZXQpKQo+ID4gPiAgCQlnb3RvIG91dF9jbGVhbjsK
PiA+ID4gIAo+ID4gPiAtCS8qIFBhaXJzIHdpdGggdGhlIG1tZHJvcCBpbiBtbXVfbm90aWZpZXJf
dW5yZWdpc3Rlcl8qICovCj4gPiA+IC0JbW1ncmFiKG1tKTsKPiA+ID4gLQo+ID4gPiAgCS8qCj4g
PiA+ICAJICogU2VyaWFsaXplIHRoZSB1cGRhdGUgYWdhaW5zdCBtbXVfbm90aWZpZXJfdW5yZWdp
c3Rlci4gQQo+ID4gPiAgCSAqIHNpZGUgbm90ZTogbW11X25vdGlmaWVyX3JlbGVhc2UgY2FuJ3Qg
cnVuIGNvbmN1cnJlbnRseSB3aXRoCj4gPiA+IEBAIC0zMDYsMTMgKzYxMiwyNiBAQCBpbnQgX19t
bXVfbm90aWZpZXJfcmVnaXN0ZXIoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sIHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tKQo+ID4gPiAgCSAqIGN1cnJlbnQtPm1tIG9yIGV4cGxpY2l0bHkgd2l0aCBnZXRf
dGFza19tbSgpIG9yIHNpbWlsYXIpLgo+ID4gPiAgCSAqIFdlIGNhbid0IHJhY2UgYWdhaW5zdCBh
bnkgb3RoZXIgbW11IG5vdGlmaWVyIG1ldGhvZCBlaXRoZXIKPiA+ID4gIAkgKiB0aGFua3MgdG8g
bW1fdGFrZV9hbGxfbG9ja3MoKS4KPiA+ID4gKwkgKgo+ID4gPiArCSAqIHJlbGVhc2Ugc2VtYW50
aWNzIGFyZSBwcm92aWRlZCBmb3IgdXNlcnMgbm90IGluc2lkZSBhIGxvY2sgY292ZXJlZAo+ID4g
PiArCSAqIGJ5IG1tX3Rha2VfYWxsX2xvY2tzKCkuIGFjcXVpcmUgY2FuIG9ubHkgYmUgdXNlZCB3
aGlsZSBob2xkaW5nIHRoZQo+ID4gPiArCSAqIG1tZ3JhYiBvciBtbWdldCwgYW5kIGlzIHNhZmUg
YmVjYXVzZSBvbmNlIGNyZWF0ZWQgdGhlCj4gPiA+ICsJICogbW11X25vdGlmaWZlcl9tbSBpcyBu
b3QgZnJlZWQgdW50aWwgdGhlIG1tIGlzIGRlc3Ryb3llZC4KPiA+ID4gIAkgKi8KPiA+ID4gIAlp
ZiAobW11X25vdGlmaWVyX21tKQo+ID4gPiAtCQltbS0+bW11X25vdGlmaWVyX21tID0gbW11X25v
dGlmaWVyX21tOwo+ID4gPiArCQlzbXBfc3RvcmVfcmVsZWFzZSgmbW0tPm1tdV9ub3RpZmllcl9t
bSwgbW11X25vdGlmaWVyX21tKTsKPiA+IAo+ID4gSSBkbyBub3QgdW5kZXJzdGFuZCB3aHkgeW91
IG5lZWQgdGhlIHJlbGVhc2Ugc2VtYW50aWNzIGhlcmUsIHdlCj4gPiBhcmUgdW5kZXIgdGhlIG1t
YXBfc2VtIGluIHdyaXRlIG1vZGUgd2hlbiB3ZSByZWxlYXNlIGl0IHRoZSBsb2NrCj4gPiBiYXJy
aWVyIHdpbGwgbWFrZSBzdXJlIGFueW9uZSBlbHNlIHNlZXMgdGhlIG5ldyBtbXVfbm90aWZpZXJf
bW0KPiAKPiBJdCBwYWlycyB3aXRoIHRoZSBzbXBfbG9hZF9hY3F1aXJlKCkgaW4gbW11X3Jhbmdl
X25vdGlmaWVyX2luc2VydCgpCj4gd2hpY2ggaXMgbm90IGNhbGxlZCB3aXRoIHRoZSBtbWFwX3Nl
bSBoZWxkLiAKPiAKPiBTaW5jZSB0aGF0IHJlYWRlciBpcyBub3QgbG9ja2VkIHdlIG5lZWQgcmVs
ZWFzZSBzZW1hbnRpY3MgaGVyZSB0bwo+IGVuc3VyZSB0aGUgdW5sb2NrZWQgcmVhZGVyIHNlZXMg
YSBmdWxseSBpbml0aW5hbGl6ZWQgbW11X25vdGlmaWVyX21tCj4gc3RydWN0dXJlIHdoZW4gaXQg
b2JzZXJ2ZXMgdGhlIHBvaW50ZXIuCgpJIHRob3VnaHQgdGhlIG1tX3Rha2VfYWxsX2xvY2tzKCkg
d291bGQgaGF2ZSBoYWQgYSBiYXJyaWVyIGFuZCB0aHVzCnRoYXQgeW91IGNvdWxkIG5vdCBzZWUg
bW11X25vdGlmaWVyIHN0cnVjdCBwYXJ0aWFseSBpbml0aWFsaXplZC4gQnV0CmhhdmluZyB0aGUg
YWNxdWlyZS9yZWxlYXNlIGFzIHNhZmV0eSBuZXQgZG9lcyBub3QgaHVydC4gTWF5YmUgYWRkIGEK
Y29tbWVudCBhYm91dCB0aGUgc3RydWN0IGluaXRpYWxpemF0aW9uIG5lZWRpbmcgdG8gYmUgdmlz
aWJsZSBiZWZvcmUKcG9pbnRlciBpcyBzZXQuCgo+IAo+ID4gPiArLyoqCj4gPiA+ICsgKiBtbXVf
cmFuZ2Vfbm90aWZpZXJfaW5zZXJ0IC0gSW5zZXJ0IGEgcmFuZ2Ugbm90aWZpZXIKPiA+ID4gKyAq
IEBtcm46IFJhbmdlIG5vdGlmaWVyIHRvIHJlZ2lzdGVyCj4gPiA+ICsgKiBAc3RhcnQ6IFN0YXJ0
aW5nIHZpcnR1YWwgYWRkcmVzcyB0byBtb25pdG9yCj4gPiA+ICsgKiBAbGVuZ3RoOiBMZW5ndGgg
b2YgdGhlIHJhbmdlIHRvIG1vbml0b3IKPiA+ID4gKyAqIEBtbSA6IG1tX3N0cnVjdCB0byBhdHRh
Y2ggdG8KPiA+ID4gKyAqCj4gPiA+ICsgKiBUaGlzIGZ1bmN0aW9uIHN1YnNjcmliZXMgdGhlIHJh
bmdlIG5vdGlmaWVyIGZvciBub3RpZmljYXRpb25zIGZyb20gdGhlIG1tLgo+ID4gPiArICogVXBv
biByZXR1cm4gdGhlIG9wcyByZWxhdGVkIHRvIG1tdV9yYW5nZV9ub3RpZmllciB3aWxsIGJlIGNh
bGxlZCB3aGVuZXZlcgo+ID4gPiArICogYW4gZXZlbnQgdGhhdCBpbnRlcnNlY3RzIHdpdGggdGhl
IGdpdmVuIHJhbmdlIG9jY3Vycy4KPiA+ID4gKyAqCj4gPiA+ICsgKiBVcG9uIHJldHVybiB0aGUg
cmFuZ2Vfbm90aWZpZXIgbWF5IG5vdCBiZSBwcmVzZW50IGluIHRoZSBpbnRlcnZhbCB0cmVlIHll
dC4KPiA+ID4gKyAqIFRoZSBjYWxsZXIgbXVzdCB1c2UgdGhlIG5vcm1hbCByYW5nZSBub3RpZmll
ciBsb2NraW5nIGZsb3cgdmlhCj4gPiA+ICsgKiBtbXVfcmFuZ2VfcmVhZF9iZWdpbigpIHRvIGVz
dGFibGlzaCBTUFRFcyBmb3IgdGhpcyByYW5nZS4KPiA+ID4gKyAqLwo+ID4gPiAraW50IG1tdV9y
YW5nZV9ub3RpZmllcl9pbnNlcnQoc3RydWN0IG1tdV9yYW5nZV9ub3RpZmllciAqbXJuLAo+ID4g
PiArCQkJICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBsZW5ndGgsCj4g
PiA+ICsJCQkgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiA+ID4gK3sKPiA+ID4gKwlzdHJ1
Y3QgbW11X25vdGlmaWVyX21tICptbW5fbW07Cj4gPiA+ICsJaW50IHJldDsKPiA+ID4gKwo+ID4g
PiArCW1pZ2h0X2xvY2soJm1tLT5tbWFwX3NlbSk7Cj4gPiA+ICsKPiA+ID4gKwltbW5fbW0gPSBz
bXBfbG9hZF9hY3F1aXJlKCZtbS0+bW11X25vdGlmaWVyX21tKTsKPiAKPiBSaWdodCBoZXJlIHdl
IGRvbid0IGhhdmUgdGhlIG1tYXBfc2VtIHNvIHRoaXMgbG9hZCBpcyB1bmxvY2tlZC4KPiAKPiBJ
ZiB3ZSBvYnNlcnZlICFtbW5fbW0gd2UgbXVzdCBhbHNvIG9ic2VydmUgYWxsIHN0b3JlcyBkb25l
IHRvIHNldCBpdAo+IHVwLiBJZSB3ZSBoYXZlIHRvIG9ic2VydmUgdGhlIHNwaW5fbG9ja19pbml0
LCBSQl9ST09UX0NBQ0hFRC9ldGMKPiAKPiA+ID4gKwlpZiAoIW1tbl9tbSB8fCAhbW1uX21tLT5o
YXNfaW50ZXJ2YWwpIHsKPiA+ID4gKwkJcmV0ID0gbW11X25vdGlmaWVyX3JlZ2lzdGVyKE5VTEws
IG1tKTsKPiA+ID4gKwkJaWYgKHJldCkKPiA+ID4gKwkJCXJldHVybiByZXQ7Cj4gPiA+ICsJCW1t
bl9tbSA9IG1tLT5tbXVfbm90aWZpZXJfbW07Cj4gPiA+ICsJfQo+ID4gPiArCXJldHVybiBfX21t
dV9yYW5nZV9ub3RpZmllcl9pbnNlcnQobXJuLCBzdGFydCwgbGVuZ3RoLCBtbW5fbW0sIG1tKTsK
PiA+ID4gK30KPiA+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKG1tdV9yYW5nZV9ub3RpZmllcl9pbnNl
cnQpOwo+ID4gPiArCj4gPiA+ICtpbnQgbW11X3JhbmdlX25vdGlmaWVyX2luc2VydF9sb2NrZWQo
c3RydWN0IG1tdV9yYW5nZV9ub3RpZmllciAqbXJuLAo+ID4gPiArCQkJCSAgICAgdW5zaWduZWQg
bG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBsZW5ndGgsCj4gPiA+ICsJCQkJICAgICBzdHJ1Y3Qg
bW1fc3RydWN0ICptbSkKPiA+ID4gK3sKPiA+ID4gKwlzdHJ1Y3QgbW11X25vdGlmaWVyX21tICpt
bW5fbW07Cj4gPiA+ICsJaW50IHJldDsKPiA+ID4gKwo+ID4gPiArCWxvY2tkZXBfYXNzZXJ0X2hl
bGRfd3JpdGUoJm1tLT5tbWFwX3NlbSk7Cj4gPiA+ICsKPiA+ID4gKwltbW5fbW0gPSBtbS0+bW11
X25vdGlmaWVyX21tOwo+ID4gCj4gPiBTaG91bGRuJ3QgeW91IGJlIHVzaW5nIHNtcF9sb2FkX2Fj
cXVpcmUoKSA/Cj4gCj4gVGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgd2hpbGUgaG9sZGluZyB0aGUg
bW1hcF9zZW0uIEFzIHlvdSBub3RlZCBhYm92ZQo+IGFsbCB3cml0ZXJzIHRvIG1tLT5tbXVfbm90
aWZpZXJfbW0gaG9sZCB0aGUgd3JpdGUgc2lkZSBvZiBtbWFwX3NlbSwKPiB0aHVzIGhlcmUgdGhl
IHJlYWQgc2lkZSBpcyBmdWxseSBsb2NrZWQgYW5kIGRvZXNuJ3QgbmVlZCB0aGUgYWNxdWlyZS4K
PiAKPiBOb3RlIHRoZSBsb2NrZGVwIGFubm90YXRpb25zIG1hcmtpbmcgdGhlIGV4cGVjdGVkIGxv
Y2tpbmcgZW52aXJvbWVudAo+IGZvciB0aGUgdHdvIGZ1bmN0aW9ucy4KClllcyBpIHRob3VnaHQg
eW91IGhhZCB0aGUgYWNxdWlyZS9yZWxlYXNlIGZvciBzb21lIG90aGVyIHJlYXNvbgp0aGFuIHN0
cnVjdCBpbml0LiBJdCBpcyBmaW5lIGhlcmUgdG8gbm90IHVzZSB0aGUgbG9hZF9hY3F1aXJlLgoK
Q2hlZXJzLApKw6lyw7RtZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
