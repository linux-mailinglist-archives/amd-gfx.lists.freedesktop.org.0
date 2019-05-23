Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF43629A7F
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 17:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00747892DC;
	Fri, 24 May 2019 15:01:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316AC89FE8;
 Thu, 23 May 2019 21:42:58 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4NLYrP6194020;
 Thu, 23 May 2019 21:42:41 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 2smsk5n8d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 May 2019 21:42:41 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4NLfaot156717;
 Thu, 23 May 2019 21:42:41 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2smsgtgmuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 May 2019 21:42:41 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4NLgaOB031829;
 Thu, 23 May 2019 21:42:37 GMT
Received: from [192.168.1.16] (/24.9.64.241)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 23 May 2019 21:42:36 +0000
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
To: Catalin Marinas <catalin.marinas@arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp> <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
 <20190523201105.oifkksus4rzcwqt4@mbp>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <047e3b90-d73e-0ca8-869c-d03b7580e644@oracle.com>
Date: Thu, 23 May 2019 15:42:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523201105.oifkksus4rzcwqt4@mbp>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9266
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905230138
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9266
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905230138
X-Mailman-Approved-At: Fri, 24 May 2019 15:01:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=fChv2jZysnH0YR2y5rlBhLoHF4XJSOv5yE7IjBMa6MI=;
 b=i5j6lJ3z4Hf6Mwe1uFCyW+Dx0BGc6CLgnMT05UhOAfwtXEFuubZ+5cv8bNXRQH8SGgIo
 3OyLnYWAZcw9X87yhv0YScSmwlfD77yg0wTvg1PD2uhxSUM5Gy8pVikHFeRo6px2TaaX
 1T5zqOZo/S3v8s0hewcbGZ3eIMfGRoZXC5u4QclbQcN+yRHCnMRvFytz7HBe/xVcQAjJ
 q7QGNHrFLf5im7IlibITLPPps1G2JhmeRisj45eynyh1gJCP32P+yM8kZMYnSTS9vT+Y
 qf/xCuv9cZn8I8m8yv46kQ4CowM5trlHuA6dN6lqyIZI05Jf3nu9oHXNSoc9l5912SdM mQ== 
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

T24gNS8yMy8xOSAyOjExIFBNLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gSGkgS2hhbGlkLAo+
IAo+IE9uIFRodSwgTWF5IDIzLCAyMDE5IGF0IDExOjUxOjQwQU0gLTA2MDAsIEtoYWxpZCBBeml6
IHdyb3RlOgo+PiBPbiA1LzIxLzE5IDY6MDQgUE0sIEtlZXMgQ29vayB3cm90ZToKPj4+IEFzIGFu
IGFzaWRlOiBJIHRoaW5rIFNwYXJjIEFESSBzdXBwb3J0IGluIExpbnV4IGFjdHVhbGx5IHNpZGUt
c3RlcHBlZAo+Pj4gdGhpc1sxXSAoaS5lLiBjaG9zZSAic29sdXRpb24gMSIpOiAiQWxsIGFkZHJl
c3NlcyBwYXNzZWQgdG8ga2VybmVsIG11c3QKPj4+IGJlIG5vbi1BREkgdGFnZ2VkIGFkZHJlc3Nl
cy4iIChBbmQgc2FkbHksICJLZXJuZWwgZG9lcyBub3QgZW5hYmxlIEFESQo+Pj4gZm9yIGtlcm5l
bCBjb2RlLiIpIEkgdGhpbmsgdGhpcyB3YXMgYSBtaXN0YWtlIHdlIHNob3VsZCBub3QgcmVwZWF0
IGZvcgo+Pj4gYXJtNjQgKHdlIGRvIHNlZW0gdG8gYmUgYXQgbGVhc3QgaW4gYWdyZWVtZW50IGFi
b3V0IHRoaXMsIEkgdGhpbmspLgo+Pj4KPj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9w
YXRjaHdvcmsvcGF0Y2gvNjU0NDgxLwo+Pgo+PiBUaGF0IGlzIGEgdmVyeSBlYXJseSB2ZXJzaW9u
IG9mIHRoZSBzcGFyYyBBREkgcGF0Y2guIFN1cHBvcnQgZm9yIHRhZ2dlZAo+PiBhZGRyZXNzZXMg
aW4gc3lzY2FsbHMgd2FzIGFkZGVkIGluIGxhdGVyIHZlcnNpb25zIGFuZCBpcyBpbiB0aGUgcGF0
Y2gKPj4gdGhhdCBpcyBpbiB0aGUga2VybmVsLgo+IAo+IEkgdHJpZWQgdG8gZmlndXJlIG91dCBi
dXQgSSdtIG5vdCBmYW1pbGlhciB3aXRoIHRoZSBzcGFyYyBwb3J0LiBIb3cgZGlkCj4geW91IHNv
bHZlIHRoZSB0YWdnZWQgYWRkcmVzcyBnb2luZyBpbnRvIHZhcmlvdXMgc3lzY2FsbCBpbXBsZW1l
bnRhdGlvbnMKPiBpbiB0aGUga2VybmVsIChlLmcuIHN5c193cml0ZSk/IElzIHRoZSB0YWcgcmVt
b3ZlZCBvbiBrZXJuZWwgZW50cnkgb3IgaXQKPiBlbmRzIHVwIGRlZXBlciBpbiB0aGUgY29yZSBj
b2RlPwoKVGFnIGlzIG5vdCByZW1vdmVkIGZyb20gdGhlIHVzZXIgYWRkcmVzc2VzLiBLZXJuZWwg
cGFzc2VzIHRhZ2dlZAphZGRyZXNzZXMgdG8gY29weV9mcm9tX3VzZXIgYW5kIGNvcHlfdG9fdXNl
ci4gTU1VIGNoZWNrcyB0aGUgdGFnCmVtYmVkZGVkIGluIHRoZSBhZGRyZXNzIHdoZW4ga2VybmVs
IGFjY2Vzc2VzIHVzZXJzcGFjZSBhZGRyZXNzZXMuIFRoaXMKbWFpbnRhaW5zIHRoZSBBREkgaW50
ZWdyaXR5IGV2ZW4gd2hlbiB1c2Vyc3BhY2UgYXR0ZW1wdHMgdG8gYWNjZXNzIGFueQp1c2Vyc3Bh
Y2UgYWRkcmVzc2VzIHRocm91Z2ggc3lzdGVtIGNhbGxzLgoKT24gc3BhcmMsIGFjY2Vzc19vaygp
IGlzIGRlZmluZWQgYXM6CgojZGVmaW5lIGFjY2Vzc19vayhhZGRyLCBzaXplKSBfX2FjY2Vzc19v
aygodW5zaWduZWQgbG9uZykoYWRkciksIHNpemUpCiNkZWZpbmUgX19hY2Nlc3Nfb2soYWRkciwg
c2l6ZSkgKF9fdXNlcl9vaygoYWRkcikgJiBnZXRfZnMoKS5zZWcsIChzaXplKSkpCiNkZWZpbmUg
X191c2VyX29rKGFkZHIsIHNpemUpICh7ICh2b2lkKShzaXplKTsgKGFkZHIpIDwgU1RBQ0tfVE9Q
OyB9KQoKU1RBQ0tfVE9QIGZvciBNNyBwcm9jZXNzb3IgKHdoaWNoIGlzIHRoZSBmaXJzdCBzcGFy
YyBwcm9jZXNzb3IgdG8Kc3VwcG9ydCBBREkpIGlzIDB4ZmZmODAwMDAwMDAwMDAwMFVMLiBUYWdn
ZWQgYWRkcmVzc2VzIHBhc3MgdGhlCmFjY2Vzc19vaygpIGNoZWNrIGZpbmUuIEFueSB0YWcgbWlz
bWF0Y2hlcyB0aGF0IGhhcHBlbiBkdXJpbmcga2VybmVsCmFjY2VzcyB0byB1c2Vyc3BhY2UgYWRk
cmVzc2VzIGFyZSBoYW5kbGVkIGJ5IGRvX21jZF9lcnIoKS4KCi0tCktoYWxpZAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
