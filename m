Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A1B139E9E
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jan 2020 01:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE4D6E1BA;
	Tue, 14 Jan 2020 00:55:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B06B6E1BA
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jan 2020 00:55:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWNacLE3Z8ABxTR2RQy8uEzN83oWcusl0NWowwpG8V792LbnJ4/2ZAhWX4atx4OHR9klMGCJDVedroTIqxQEFWR4m7yfbXpUsMflsevkJ7iNSr4U4IckPQaALjaK3TjCXUPYpdWPs6R5nzW123zEFq+KbyuxlZNLkplDPQ0wENXQtOlTcFLrZSbP2odU2RMxZsqYcZkocUE5CUK+HfJqEqaRlkKhs3G4qPZnWI1JyuVUCKbTnpz6jxHTMbEfl9voMXqGG/oq+/A1cA3YcaeUAuUMddFMdGqMZKVIiXpPTiuuXs5bjEuiEr5GJK83k6mWXk8c7YbUUV+1t2UqSnqDiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCtLmRK4r9RTLWuiumsAD2mjuxtMLa/cA1FyyD1/El8=;
 b=V+kbEzHoCIQ76VswfJfyiHVtIOAlE+bzhHbb8FyJm58MGcSVX7GyqsFwmbELzSa0bw/kKBEdduLg1N2gXALVBCpY54bP79/NCV7tYXiRvuSxN1sLku9fJ1tKnG99qQw/yuGpVbSuZS53n+TNxuMQGBIIqex9bvUe19+OcpnvrlLkhli4R+dL97F3fVKFbkciSzUstnkU/4kz1UiMRQ/ZD4Z7im7pliBlkXCV7hl1dKxOBJs21XtW0GJbmJhtOj9yFlaQyyUvoG01qdI0g1Vfrq/SrqHJW7bwuv6i/PdzOSwxEt23ISV/+r9AiLI40NxhE3PGiMoZvBoPkyAca7ZxrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCtLmRK4r9RTLWuiumsAD2mjuxtMLa/cA1FyyD1/El8=;
 b=V0g2Ds7hIIB1YEiq4OqpDk6KMFXpuxmNIoRRm4OKOQfuTgv8xKuguYKLCqBspKGxWJ2A3WUFoXOKGxvmBZqdH/22kym5ePgG0PrOPfY2UcIiri9IUhdjg8NYPZYqCl6N9QqQIB6ApPiMJVZaAD7aHEH5ep5pZgsmxVOcJ0jByPs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
Received: from DM5PR1201MB0090.namprd12.prod.outlook.com (10.174.105.140) by
 DM5PR1201MB2552.namprd12.prod.outlook.com (10.172.87.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Tue, 14 Jan 2020 00:55:13 +0000
Received: from DM5PR1201MB0090.namprd12.prod.outlook.com
 ([fe80::7119:ff0:b3eb:619c]) by DM5PR1201MB0090.namprd12.prod.outlook.com
 ([fe80::7119:ff0:b3eb:619c%4]) with mapi id 15.20.2623.015; Tue, 14 Jan 2020
 00:55:13 +0000
Subject: Re: [PATCH 5/7] drm/amdgpu: export function to flush TLB via pasid
To: "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20200113202629.94021-3-alex.sierra@amd.com>
 <20200113202629.94021-5-alex.sierra@amd.com>
 <af03a714-87a5-74b8-7e37-ae3dae0db80b@amd.com>
 <SN6PR12MB2621E3727E4CC464493F1A50FD340@SN6PR12MB2621.namprd12.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <4e81c189-67b7-613e-7100-21da24d46fe7@amd.com>
Date: Mon, 13 Jan 2020 19:55:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <SN6PR12MB2621E3727E4CC464493F1A50FD340@SN6PR12MB2621.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28)
 To DM5PR1201MB0090.namprd12.prod.outlook.com
 (2603:10b6:4:53::12)
MIME-Version: 1.0
Received: from [172.27.226.80] (165.204.55.251) by
 YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9 via Frontend Transport; Tue, 14 Jan 2020 00:55:13 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5b700be0-a673-4a7c-8dc1-08d7988c69ac
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2552:|DM5PR1201MB2552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2552D6F78F775F8CE2C7F8C392340@DM5PR1201MB2552.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 028256169F
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(189003)(199004)(16576012)(6486002)(110136005)(8936002)(81156014)(8676002)(316002)(81166006)(31686004)(44832011)(30864003)(2906002)(36756003)(86362001)(2616005)(956004)(36916002)(52116002)(5660300002)(66476007)(66946007)(66556008)(31696002)(478600001)(26005)(16526019)(186003)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2552;
 H:DM5PR1201MB0090.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qGjIJSRgVZSmu9hoVx2bs7WMuwvBQsJRZzHNv55CqU6w7mymyBuuXUtF3+NMxFxfpYbiNrZzk+dlIPHU4Mfvyx4Jiuv4EXCZSJ4sHOlrxYjru/xLa2TYrlOuJoFiA5+zE+LfKozWvNVPO9pULY3ckddbUfVgunStICovefEA5/4PiT380EowxHB/NkemcmbBtzqfqe2oYyiySl6Em0fFlAslRjO2kVIb2QWS5RJGoJFhhkCEoyZr+q/koMP06WbPnCOFfEWauaYP53Uxsx2gGKltRxA15kxy1NRDY4vvc6IFCXUsv1uKWDL0XVcp9kZO+Z9MU4agLEBIHQ+VewqRUl3d+R8QJSQgji1PyEYoHOu8F7UGsym5qai8+c36PwNFb+5jxrRq0Me+P81eIvgKZyUHx79xeY0Ie79IC5uhLoPGszqE7dTJyPHpg4Q2KtV0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b700be0-a673-4a7c-8dc1-08d7988c69ac
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2020 00:55:13.3823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ptui0mi2COOnuFtWLE8gSrQ8XOyN6bJ/2fa1Hfch4PxEUJYrHIvkMcSLRy/T56mjgziu1FDb5SOdBXEgkVz8bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2552
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSBub3RpY2VkIHRoYXQgdGhlIGludmFsaWRhdGVfdGxic19zaXplIGluIHBhdGNoIDMgd2FzIGFs
c28gd3JvbmcuIFRoYXQgCnNob3VsZCBvbmx5IGJlIDIgZHdvcmRzLCBub3QgMTIuIFRoZSBjb2Rl
IGhlcmUgc2hvdWxkIGRvCgogwqDCoMKgIGFtZGdwdV9yaW5nX2FsbG9jKHJpbmcsIGtpcS0+cG1m
LT5pbnZhbGlkYXRlX3RsYnNfc2l6ZSArIDgpOwoKSSB0aGluayAxMiB3YXMgdG9vIG11Y2ggaW4g
dGhlIG9yaWdpbmFsIGNvZGUuIEZsdXNoICsgZmVuY2Ugc2hvdWxkIG9ubHkgCmJlIDEwIGR3b3Jk
cywgdW5sZXNzIEkgbWlzc2VzIHNvbWV0aGluZyBvciBjb3VudGVkIHdyb25nLgoKUmVnYXJkcywK
IMKgIEZlbGl4CgpPbiAyMDIwLTAxLTEzIDc6NDggcC5tLiwgU2llcnJhIEd1aXphLCBBbGVqYW5k
cm8gKEFsZXgpIHdyb3RlOgo+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBJbnRlcm5hbCBEaXN0
cmlidXRpb24gT25seV0KPgo+IEkganVzdCBwdXNoZWQgdGhlIHNlcmllcywgYnV0IEknbGwgZ28g
YWhlYWQgYW5kIGNyZWF0ZSBhIG5ldyBwYXRjaCBmb3IgdGhpcy4KPiBUaGUgLmludmFsaWRhdGVf
dGxic19zaXplLCBpcyBpdCBiYXNlZCBvbiBkd29yZCBzaXplPyBDdXJyZW50bHkgaXMgMTIsIHNo
b3VsZCBJIG5lZWQgdG8gZHJvcCBpdCB0byA4IHRoZW4/Cj4KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQo+IEZyb206IEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4K
PiBTZW50OiBNb25kYXksIEphbnVhcnkgMTMsIDIwMjAgNjozNCBQTQo+IFRvOiBTaWVycmEgR3Vp
emEsIEFsZWphbmRybyAoQWxleCkgPEFsZXguU2llcnJhQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNS83XSBkcm0vYW1kZ3B1OiBl
eHBvcnQgZnVuY3Rpb24gdG8gZmx1c2ggVExCIHZpYSBwYXNpZAo+Cj4gU29ycnksIEkgYWxyZWFk
eSBzYWlkLCBSZXZpZXdlZC1ieSwgYnV0IHJlYWxpemVkIHRoZXJlIHdhcyBvbmUgbW9yZSBwcm9i
bGVtLiBJZiB5b3UgaGF2ZW4ndCBzdWJtaXR0ZWQgeWV0LCBwbGVhc2UgZml4IHRoYXQgZmlyc3Qu
IE90aGVyd2lzZSwgcGxlYXNlIG1ha2UgaXQgYSBmb2xsb3ctdXAgcGF0Y2guIFNlZSBpbmxpbmUg
Li4uCj4KPiBPbiAyMDIwLTAxLTEzIDM6MjYgcC5tLiwgQWxleCBTaWVycmEgd3JvdGU6Cj4+IFRo
aXMgY2FuIGJlIHVzZWQgZGlyZWN0bHkgZnJvbSBhbWRncHUgYW5kIGFtZGtmZCB0byBpbnZhbGlk
YXRlIFRMQgo+PiB0aHJvdWdoIHBhc2lkLgo+PiBJdCBzdXBwb3J0cyBnbWMgdjcsIHY4LCB2OSBh
bmQgdjEwLgo+Pgo+PiBDaGFuZ2UtSWQ6IEk2NTYzYThlYmEyZTQyZDFhNjdmYTI1NDcxNTZjMjBk
YTQxZDFlNDkwCj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggU2llcnJhIDxhbGV4LnNpZXJyYUBhbWQu
Y29tPgo+PiAtLS0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5o
IHwgIDYgKysKPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMgIHwg
NzQgKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192N18wLmMgICB8IDMzICsrKysrKysrKysrCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OF8wLmMgICB8IDM0ICsrKysrKysrKysrCj4+ICAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICB8IDc2ICsrKysrKysrKysrKysrKysrKysrKysr
KysKPj4gICAgNSBmaWxlcyBjaGFuZ2VkLCAyMjMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oCj4+IGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oCj4+IGluZGV4IGM5MWRkNjAyZDVmMS4u
ZDNjMjdhM2M0M2Y2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZ21jLmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dt
Yy5oCj4+IEBAIC05Miw2ICs5Miw5IEBAIHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIHsKPj4gICAg
CS8qIGZsdXNoIHRoZSB2bSB0bGIgdmlhIG1taW8gKi8KPj4gICAgCXZvaWQgKCpmbHVzaF9ncHVf
dGxiKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgdm1pZCwKPj4gICAgCQkJ
CXVpbnQzMl90IHZtaHViLCB1aW50MzJfdCBmbHVzaF90eXBlKTsKPj4gKwkvKiBmbHVzaCB0aGUg
dm0gdGxiIHZpYSBwYXNpZCAqLwo+PiArCWludCAoKmZsdXNoX2dwdV90bGJfcGFzaWQpKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MTZfdCBwYXNpZCwKPj4gKwkJCQkJdWludDMyX3Qg
Zmx1c2hfdHlwZSwgYm9vbCBhbGxfaHViKTsKPj4gICAgCS8qIGZsdXNoIHRoZSB2bSB0bGIgdmlh
IHJpbmcgKi8KPj4gICAgCXVpbnQ2NF90ICgqZW1pdF9mbHVzaF9ncHVfdGxiKShzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcsIHVuc2lnbmVkIHZtaWQsCj4+ICAgIAkJCQkgICAgICAgdWludDY0X3Qg
cGRfYWRkcik7Cj4+IEBAIC0yMTYsNiArMjE5LDkgQEAgc3RydWN0IGFtZGdwdV9nbWMgewo+PiAg
ICB9Owo+PiAgICAKPj4gICAgI2RlZmluZSBhbWRncHVfZ21jX2ZsdXNoX2dwdV90bGIoYWRldiwg
dm1pZCwgdm1odWIsIHR5cGUpCj4+ICgoYWRldiktPmdtYy5nbWNfZnVuY3MtPmZsdXNoX2dwdV90
bGIoKGFkZXYpLCAodm1pZCksICh2bWh1YiksCj4+ICh0eXBlKSkpCj4+ICsjZGVmaW5lIGFtZGdw
dV9nbWNfZmx1c2hfZ3B1X3RsYl9wYXNpZChhZGV2LCBwYXNpZCwgdHlwZSwgYWxsaHViKSBcCj4+
ICsJKChhZGV2KS0+Z21jLmdtY19mdW5jcy0+Zmx1c2hfZ3B1X3RsYl9wYXNpZCBcCj4+ICsJKChh
ZGV2KSwgKHBhc2lkKSwgKHR5cGUpLCAoYWxsaHViKSkpCj4+ICAgICNkZWZpbmUgYW1kZ3B1X2dt
Y19lbWl0X2ZsdXNoX2dwdV90bGIociwgdm1pZCwgYWRkcikgKHIpLT5hZGV2LT5nbWMuZ21jX2Z1
bmNzLT5lbWl0X2ZsdXNoX2dwdV90bGIoKHIpLCAodm1pZCksIChhZGRyKSkKPj4gICAgI2RlZmlu
ZSBhbWRncHVfZ21jX2VtaXRfcGFzaWRfbWFwcGluZyhyLCB2bWlkLCBwYXNpZCkgKHIpLT5hZGV2
LT5nbWMuZ21jX2Z1bmNzLT5lbWl0X3Bhc2lkX21hcHBpbmcoKHIpLCAodm1pZCksIChwYXNpZCkp
Cj4+ICAgICNkZWZpbmUgYW1kZ3B1X2dtY19tYXBfbXR5cGUoYWRldiwgZmxhZ3MpCj4+IChhZGV2
KS0+Z21jLmdtY19mdW5jcy0+bWFwX210eXBlKChhZGV2KSwoZmxhZ3MpKQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKPj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYwo+PiBpbmRleCA1YWQ4OWJiNmYzYmEuLjhhZmQw
NTgzNDcxNCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Yx
MF8wLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKPj4g
QEAgLTMwLDYgKzMwLDggQEAKPj4gICAgI2luY2x1ZGUgImhkcC9oZHBfNV8wXzBfc2hfbWFzay5o
Igo+PiAgICAjaW5jbHVkZSAiZ2MvZ2NfMTBfMV8wX3NoX21hc2suaCIKPj4gICAgI2luY2x1ZGUg
Im1taHViL21taHViXzJfMF8wX3NoX21hc2suaCIKPj4gKyNpbmNsdWRlICJhdGh1Yi9hdGh1Yl8y
XzBfMF9zaF9tYXNrLmgiCj4+ICsjaW5jbHVkZSAiYXRodWIvYXRodWJfMl8wXzBfb2Zmc2V0Lmgi
Cj4+ICAgICNpbmNsdWRlICJkY24vZGNuXzJfMF8wX29mZnNldC5oIgo+PiAgICAjaW5jbHVkZSAi
ZGNuL2Rjbl8yXzBfMF9zaF9tYXNrLmgiCj4+ICAgICNpbmNsdWRlICJvc3Mvb3Nzc3lzXzVfMF8w
X29mZnNldC5oIgo+PiBAQCAtMzcsNiArMzksNyBAQAo+PiAgICAjaW5jbHVkZSAibmF2aTEwX2Vu
dW0uaCIKPj4gICAgCj4+ICAgICNpbmNsdWRlICJzb2MxNS5oIgo+PiArI2luY2x1ZGUgInNvYzE1
ZC5oIgo+PiAgICAjaW5jbHVkZSAic29jMTVfY29tbW9uLmgiCj4+ICAgIAo+PiAgICAjaW5jbHVk
ZSAibmJpb192Ml8zLmgiCj4+IEBAIC0yMzQsNiArMjM3LDE5IEBAIHN0YXRpYyBib29sIGdtY192
MTBfMF91c2VfaW52YWxpZGF0ZV9zZW1hcGhvcmUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
Cj4+ICAgIAkJKCFhbWRncHVfc3Jpb3ZfdmYoYWRldikpKTsKPj4gICAgfQo+PiAgICAKPj4gK3N0
YXRpYyBib29sIGdtY192MTBfMF9nZXRfYXRjX3ZtaWRfcGFzaWRfbWFwcGluZ19pbmZvKAo+PiAr
CQkJCQlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPj4gKwkJCQkJdWludDhfdCB2bWlkLCB1
aW50MTZfdCAqcF9wYXNpZCkgewo+PiArCXVpbnQzMl90IHZhbHVlOwo+PiArCj4+ICsJdmFsdWUg
PSBSUkVHMzIoU09DMTVfUkVHX09GRlNFVChBVEhVQiwgMCwgbW1BVENfVk1JRDBfUEFTSURfTUFQ
UElORykKPj4gKwkJICAgICArIHZtaWQpOwo+PiArCSpwX3Bhc2lkID0gdmFsdWUgJiBBVENfVk1J
RDBfUEFTSURfTUFQUElOR19fUEFTSURfTUFTSzsKPj4gKwo+PiArCXJldHVybiAhISh2YWx1ZSAm
IEFUQ19WTUlEMF9QQVNJRF9NQVBQSU5HX19WQUxJRF9NQVNLKTsKPj4gK30KPj4gKwo+PiAgICAv
Kgo+PiAgICAgKiBHQVJUCj4+ICAgICAqIFZNSUQgMCBpcyB0aGUgcGh5c2ljYWwgR1BVIGFkZHJl
c3NlcyBhcyB1c2VkIGJ5IHRoZSBrZXJuZWwuCj4+IEBAIC0zODAsNiArMzk2LDYzIEBAIHN0YXRp
YyB2b2lkIGdtY192MTBfMF9mbHVzaF9ncHVfdGxiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCB1aW50MzJfdCB2bWlkLAo+PiAgICAJRFJNX0VSUk9SKCJFcnJvciBmbHVzaGluZyBHUFUgVExC
IHVzaW5nIHRoZSBTRE1BICglZCkhXG4iLCByKTsKPj4gICAgfQo+PiAgICAKPj4gKy8qKgo+PiAr
ICogZ21jX3YxMF8wX2ZsdXNoX2dwdV90bGJfcGFzaWQgLSB0bGIgZmx1c2ggdmlhIHBhc2lkCj4+
ICsgKgo+PiArICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+PiArICogQHBhc2lkOiBw
YXNpZCB0byBiZSBmbHVzaAo+PiArICoKPj4gKyAqIEZsdXNoIHRoZSBUTEIgZm9yIHRoZSByZXF1
ZXN0ZWQgcGFzaWQuCj4+ICsgKi8KPj4gK3N0YXRpYyBpbnQgZ21jX3YxMF8wX2ZsdXNoX2dwdV90
bGJfcGFzaWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+ICsJCQkJCXVpbnQxNl90IHBh
c2lkLCB1aW50MzJfdCBmbHVzaF90eXBlLAo+PiArCQkJCQlib29sIGFsbF9odWIpCj4+ICt7Cj4+
ICsJaW50IHZtaWQsIGk7Cj4+ICsJc2lnbmVkIGxvbmcgcjsKPj4gKwl1aW50MzJfdCBzZXE7Cj4+
ICsJdWludDE2X3QgcXVlcmllZF9wYXNpZDsKPj4gKwlib29sIHJldDsKPj4gKwlzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcgPSAmYWRldi0+Z2Z4LmtpcS5yaW5nOwo+PiArCXN0cnVjdCBhbWRncHVf
a2lxICpraXEgPSAmYWRldi0+Z2Z4LmtpcTsKPj4gKwo+PiArCWlmIChhbWRncHVfZW11X21vZGUg
PT0gMCAmJiByaW5nLT5zY2hlZC5yZWFkeSkgewo+PiArCQlzcGluX2xvY2soJmFkZXYtPmdmeC5r
aXEucmluZ19sb2NrKTsKPj4gKwkJYW1kZ3B1X3JpbmdfYWxsb2MocmluZywga2lxLT5wbWYtPmlu
dmFsaWRhdGVfdGxic19zaXplKTsKPiBZb3UgbmVlZCB0byBhbGxvY2F0ZSBtb3JlIHNwYWNlIGhl
cmUgZm9yIGFtZGdwdV9mZW5jZV9lbWl0X3BvbGxpbmcuCj4gTG9va3MgbGlrZSBnZnhfdjEwXzBf
cmluZ19lbWl0X2ZlbmNlIG5lZWRzIDggZHdvcmRzLgo+Cj4KPj4gKwkJa2lxLT5wbWYtPmtpcV9p
bnZhbGlkYXRlX3RsYnMocmluZywKPj4gKwkJCQkJcGFzaWQsIGZsdXNoX3R5cGUsIGFsbF9odWIp
Owo+PiArCQlhbWRncHVfZmVuY2VfZW1pdF9wb2xsaW5nKHJpbmcsICZzZXEpOwo+PiArCQlhbWRn
cHVfcmluZ19jb21taXQocmluZyk7Cj4+ICsJCXNwaW5fdW5sb2NrKCZhZGV2LT5nZngua2lxLnJp
bmdfbG9jayk7Cj4+ICsJCXIgPSBhbWRncHVfZmVuY2Vfd2FpdF9wb2xsaW5nKHJpbmcsIHNlcSwg
YWRldi0+dXNlY190aW1lb3V0KTsKPj4gKwkJaWYgKHIgPCAxKSB7Cj4+ICsJCQlEUk1fRVJST1Io
IndhaXQgZm9yIGtpcSBmZW5jZSBlcnJvcjogJWxkLlxuIiwgcik7Cj4+ICsJCQlyZXR1cm4gLUVU
SU1FOwo+PiArCQl9Cj4+ICsKPj4gKwkJcmV0dXJuIDA7Cj4+ICsJfQo+PiArCj4+ICsJZm9yICh2
bWlkID0gMTsgdm1pZCA8IDE2OyB2bWlkKyspIHsKPj4gKwo+PiArCQlyZXQgPSBnbWNfdjEwXzBf
Z2V0X2F0Y192bWlkX3Bhc2lkX21hcHBpbmdfaW5mbyhhZGV2LCB2bWlkLAo+PiArCQkJCSZxdWVy
aWVkX3Bhc2lkKTsKPj4gKwkJaWYgKHJldAkmJiBxdWVyaWVkX3Bhc2lkID09IHBhc2lkKSB7Cj4+
ICsJCQlpZiAoYWxsX2h1Yikgewo+PiArCQkJCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5udW1fdm1o
dWJzOyBpKyspCj4+ICsJCQkJCWdtY192MTBfMF9mbHVzaF9ncHVfdGxiKGFkZXYsIHZtaWQsCj4+
ICsJCQkJCQkJaSwgMCk7Cj4+ICsJCQl9IGVsc2Ugewo+PiArCQkJCWdtY192MTBfMF9mbHVzaF9n
cHVfdGxiKGFkZXYsIHZtaWQsCj4+ICsJCQkJCQlBTURHUFVfR0ZYSFVCXzAsIDApOwo+PiArCQkJ
fQo+PiArCQkJYnJlYWs7Cj4+ICsJCX0KPj4gKwl9Cj4+ICsKPj4gKwlyZXR1cm4gMDsKPj4gK30K
Pj4gKwo+PiAgICBzdGF0aWMgdWludDY0X3QgZ21jX3YxMF8wX2VtaXRfZmx1c2hfZ3B1X3RsYihz
dHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCj4+ICAgIAkJCQkJICAgICB1bnNpZ25lZCB2bWlkLCB1
aW50NjRfdCBwZF9hZGRyKQo+PiAgICB7Cj4+IEBAIC01MzEsNiArNjA0LDcgQEAgc3RhdGljIHZv
aWQgZ21jX3YxMF8wX2dldF92bV9wdGUoc3RydWN0Cj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+
ICAgIAo+PiAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9nbWNfZnVuY3MgZ21jX3YxMF8w
X2dtY19mdW5jcyA9IHsKPj4gICAgCS5mbHVzaF9ncHVfdGxiID0gZ21jX3YxMF8wX2ZsdXNoX2dw
dV90bGIsCj4+ICsJLmZsdXNoX2dwdV90bGJfcGFzaWQgPSBnbWNfdjEwXzBfZmx1c2hfZ3B1X3Rs
Yl9wYXNpZCwKPj4gICAgCS5lbWl0X2ZsdXNoX2dwdV90bGIgPSBnbWNfdjEwXzBfZW1pdF9mbHVz
aF9ncHVfdGxiLAo+PiAgICAJLmVtaXRfcGFzaWRfbWFwcGluZyA9IGdtY192MTBfMF9lbWl0X3Bh
c2lkX21hcHBpbmcsCj4+ICAgIAkubWFwX210eXBlID0gZ21jX3YxMF8wX21hcF9tdHlwZSwKPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmMKPj4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jCj4+IGluZGV4IGYwOGU1MzMwNjQy
ZC4uMTlkNWIxMzNlMWQ3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjdfMC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18w
LmMKPj4gQEAgLTQxOCw2ICs0MTgsMzggQEAgc3RhdGljIGludCBnbWNfdjdfMF9tY19pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+PiAgICAJcmV0dXJuIDA7Cj4+ICAgIH0KPj4gICAg
Cj4+ICsvKioKPj4gKyAqIGdtY192N18wX2ZsdXNoX2dwdV90bGJfcGFzaWQgLSB0bGIgZmx1c2gg
dmlhIHBhc2lkCj4+ICsgKgo+PiArICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+PiAr
ICogQHBhc2lkOiBwYXNpZCB0byBiZSBmbHVzaAo+PiArICoKPj4gKyAqIEZsdXNoIHRoZSBUTEIg
Zm9yIHRoZSByZXF1ZXN0ZWQgcGFzaWQuCj4+ICsgKi8KPj4gK3N0YXRpYyBpbnQgZ21jX3Y3XzBf
Zmx1c2hfZ3B1X3RsYl9wYXNpZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPj4gKwkJCQkJ
dWludDE2X3QgcGFzaWQsIHVpbnQzMl90IGZsdXNoX3R5cGUsCj4+ICsJCQkJCWJvb2wgYWxsX2h1
YikKPj4gK3sKPj4gKwlpbnQgdm1pZDsKPj4gKwl1bnNpZ25lZCBpbnQgdG1wOwo+PiArCj4+ICsJ
aWYgKGFkZXYtPmluX2dwdV9yZXNldCkKPj4gKwkJcmV0dXJuIC1FSU87Cj4+ICsKPj4gKwlmb3Ig
KHZtaWQgPSAxOyB2bWlkIDwgMTY7IHZtaWQrKykgewo+PiArCj4+ICsJCXRtcCA9IFJSRUczMiht
bUFUQ19WTUlEMF9QQVNJRF9NQVBQSU5HICsgdm1pZCk7Cj4+ICsJCWlmICgodG1wICYgQVRDX1ZN
SUQwX1BBU0lEX01BUFBJTkdfX1ZBTElEX01BU0spICYmCj4+ICsJCQkodG1wICYgQVRDX1ZNSUQw
X1BBU0lEX01BUFBJTkdfX1BBU0lEX01BU0spID09IHBhc2lkKSB7Cj4+ICsJCQlXUkVHMzIobW1W
TV9JTlZBTElEQVRFX1JFUVVFU1QsIDEgPDwgdm1pZCk7Cj4+ICsJCQlSUkVHMzIobW1WTV9JTlZB
TElEQVRFX1JFU1BPTlNFKTsKPj4gKwkJCWJyZWFrOwo+PiArCQl9Cj4+ICsJfQo+PiArCj4+ICsJ
cmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gICAgLyoKPj4gICAgICogR0FSVAo+PiAgICAgKiBWTUlE
IDAgaXMgdGhlIHBoeXNpY2FsIEdQVSBhZGRyZXNzZXMgYXMgdXNlZCBieSB0aGUga2VybmVsLgo+
PiBAQCAtMTMzMyw2ICsxMzY1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRfaXBfZnVuY3MK
Pj4gZ21jX3Y3XzBfaXBfZnVuY3MgPSB7Cj4+ICAgIAo+PiAgICBzdGF0aWMgY29uc3Qgc3RydWN0
IGFtZGdwdV9nbWNfZnVuY3MgZ21jX3Y3XzBfZ21jX2Z1bmNzID0gewo+PiAgICAJLmZsdXNoX2dw
dV90bGIgPSBnbWNfdjdfMF9mbHVzaF9ncHVfdGxiLAo+PiArCS5mbHVzaF9ncHVfdGxiX3Bhc2lk
ID0gZ21jX3Y3XzBfZmx1c2hfZ3B1X3RsYl9wYXNpZCwKPj4gICAgCS5lbWl0X2ZsdXNoX2dwdV90
bGIgPSBnbWNfdjdfMF9lbWl0X2ZsdXNoX2dwdV90bGIsCj4+ICAgIAkuZW1pdF9wYXNpZF9tYXBw
aW5nID0gZ21jX3Y3XzBfZW1pdF9wYXNpZF9tYXBwaW5nLAo+PiAgICAJLnNldF9wcnQgPSBnbWNf
djdfMF9zZXRfcHJ0LAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3Y4XzAuYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMKPj4g
aW5kZXggNmQ5NmQ0MGZiY2I4Li4yN2Q4MzIwNGZhMmIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y4XzAuYwo+PiBAQCAtNjIwLDYgKzYyMCwzOSBAQCBzdGF0aWMgaW50IGdt
Y192OF8wX21jX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+ICAgIAlyZXR1cm4g
MDsKPj4gICAgfQo+PiAgICAKPj4gKy8qKgo+PiArICogZ21jX3Y4XzBfZmx1c2hfZ3B1X3RsYl9w
YXNpZCAtIHRsYiBmbHVzaCB2aWEgcGFzaWQKPj4gKyAqCj4+ICsgKiBAYWRldjogYW1kZ3B1X2Rl
dmljZSBwb2ludGVyCj4+ICsgKiBAcGFzaWQ6IHBhc2lkIHRvIGJlIGZsdXNoCj4+ICsgKgo+PiAr
ICogRmx1c2ggdGhlIFRMQiBmb3IgdGhlIHJlcXVlc3RlZCBwYXNpZC4KPj4gKyAqLwo+PiArc3Rh
dGljIGludCBnbWNfdjhfMF9mbHVzaF9ncHVfdGxiX3Bhc2lkKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LAo+PiArCQkJCQl1aW50MTZfdCBwYXNpZCwgdWludDMyX3QgZmx1c2hfdHlwZSwKPj4g
KwkJCQkJYm9vbCBhbGxfaHViKQo+PiArewo+PiArCWludCB2bWlkOwo+PiArCXVuc2lnbmVkIGlu
dCB0bXA7Cj4+ICsKPj4gKwlpZiAoYWRldi0+aW5fZ3B1X3Jlc2V0KQo+PiArCQlyZXR1cm4gLUVJ
TzsKPj4gKwo+PiArCWZvciAodm1pZCA9IDE7IHZtaWQgPCAxNjsgdm1pZCsrKSB7Cj4+ICsKPj4g
KwkJdG1wID0gUlJFRzMyKG1tQVRDX1ZNSUQwX1BBU0lEX01BUFBJTkcgKyB2bWlkKTsKPj4gKwkJ
aWYgKCh0bXAgJiBBVENfVk1JRDBfUEFTSURfTUFQUElOR19fVkFMSURfTUFTSykgJiYKPj4gKwkJ
CSh0bXAgJiBBVENfVk1JRDBfUEFTSURfTUFQUElOR19fUEFTSURfTUFTSykgPT0gcGFzaWQpIHsK
Pj4gKwkJCVdSRUczMihtbVZNX0lOVkFMSURBVEVfUkVRVUVTVCwgMSA8PCB2bWlkKTsKPj4gKwkJ
CVJSRUczMihtbVZNX0lOVkFMSURBVEVfUkVTUE9OU0UpOwo+PiArCQkJYnJlYWs7Cj4+ICsJCX0K
Pj4gKwl9Cj4+ICsKPj4gKwlyZXR1cm4gMDsKPj4gKwo+PiArfQo+PiArCj4+ICAgIC8qCj4+ICAg
ICAqIEdBUlQKPj4gICAgICogVk1JRCAwIGlzIHRoZSBwaHlzaWNhbCBHUFUgYWRkcmVzc2VzIGFz
IHVzZWQgYnkgdGhlIGtlcm5lbC4KPj4gQEAgLTE3MDAsNiArMTczMyw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgYW1kX2lwX2Z1bmNzCj4+IGdtY192OF8wX2lwX2Z1bmNzID0gewo+PiAgICAKPj4g
ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIGdtY192OF8wX2dtY19mdW5j
cyA9IHsKPj4gICAgCS5mbHVzaF9ncHVfdGxiID0gZ21jX3Y4XzBfZmx1c2hfZ3B1X3RsYiwKPj4g
KwkuZmx1c2hfZ3B1X3RsYl9wYXNpZCA9IGdtY192OF8wX2ZsdXNoX2dwdV90bGJfcGFzaWQsCj4+
ICAgIAkuZW1pdF9mbHVzaF9ncHVfdGxiID0gZ21jX3Y4XzBfZW1pdF9mbHVzaF9ncHVfdGxiLAo+
PiAgICAJLmVtaXRfcGFzaWRfbWFwcGluZyA9IGdtY192OF8wX2VtaXRfcGFzaWRfbWFwcGluZywK
Pj4gICAgCS5zZXRfcHJ0ID0gZ21jX3Y4XzBfc2V0X3BydCwKPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jCj4+IGluZGV4IGI4M2M4ZDc0NWY0Mi4uNDBhNDk2ODA0MzU2IDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKPj4gQEAgLTM4LDEwICsz
OCwxMiBAQAo+PiAgICAjaW5jbHVkZSAiZGNlL2RjZV8xMl8wX3NoX21hc2suaCIKPj4gICAgI2lu
Y2x1ZGUgInZlZ2ExMF9lbnVtLmgiCj4+ICAgICNpbmNsdWRlICJtbWh1Yi9tbWh1Yl8xXzBfb2Zm
c2V0LmgiCj4+ICsjaW5jbHVkZSAiYXRodWIvYXRodWJfMV8wX3NoX21hc2suaCIKPj4gICAgI2lu
Y2x1ZGUgImF0aHViL2F0aHViXzFfMF9vZmZzZXQuaCIKPj4gICAgI2luY2x1ZGUgIm9zcy9vc3Nz
eXNfNF8wX29mZnNldC5oIgo+PiAgICAKPj4gICAgI2luY2x1ZGUgInNvYzE1LmgiCj4+ICsjaW5j
bHVkZSAic29jMTVkLmgiCj4+ICAgICNpbmNsdWRlICJzb2MxNV9jb21tb24uaCIKPj4gICAgI2lu
Y2x1ZGUgInVtYy91bWNfNl8wX3NoX21hc2suaCIKPj4gICAgCj4+IEBAIC00NDEsNiArNDQzLDE4
IEBAIHN0YXRpYyBib29sIGdtY192OV8wX3VzZV9pbnZhbGlkYXRlX3NlbWFwaG9yZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKPj4gICAgCQkgICBhZGV2LT5wZGV2LT5kZXZpY2UgPT0gMHgx
NWQ4KSkpOwo+PiAgICB9Cj4+ICAgIAo+PiArc3RhdGljIGJvb2wgZ21jX3Y5XzBfZ2V0X2F0Y192
bWlkX3Bhc2lkX21hcHBpbmdfaW5mbyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPj4gKwkJ
CQkJdWludDhfdCB2bWlkLCB1aW50MTZfdCAqcF9wYXNpZCkgewo+PiArCXVpbnQzMl90IHZhbHVl
Owo+PiArCj4+ICsJdmFsdWUgPSBSUkVHMzIoU09DMTVfUkVHX09GRlNFVChBVEhVQiwgMCwgbW1B
VENfVk1JRDBfUEFTSURfTUFQUElORykKPj4gKwkJICAgICArIHZtaWQpOwo+PiArCSpwX3Bhc2lk
ID0gdmFsdWUgJiBBVENfVk1JRDBfUEFTSURfTUFQUElOR19fUEFTSURfTUFTSzsKPj4gKwo+PiAr
CXJldHVybiAhISh2YWx1ZSAmIEFUQ19WTUlEMF9QQVNJRF9NQVBQSU5HX19WQUxJRF9NQVNLKTsK
Pj4gK30KPj4gKwo+PiAgICAvKgo+PiAgICAgKiBHQVJUCj4+ICAgICAqIFZNSUQgMCBpcyB0aGUg
cGh5c2ljYWwgR1BVIGFkZHJlc3NlcyBhcyB1c2VkIGJ5IHRoZSBrZXJuZWwuCj4+IEBAIC01Mzks
NiArNTUzLDY3IEBAIHN0YXRpYyB2b2lkIGdtY192OV8wX2ZsdXNoX2dwdV90bGIoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsCj4+ICAgIAlEUk1fRVJST1IoIlRpbWVv
dXQgd2FpdGluZyBmb3IgVk0gZmx1c2ggQUNLIVxuIik7Cj4+ICAgIH0KPj4gICAgCj4+ICsvKioK
Pj4gKyAqIGdtY192OV8wX2ZsdXNoX2dwdV90bGJfcGFzaWQgLSB0bGIgZmx1c2ggdmlhIHBhc2lk
Cj4+ICsgKgo+PiArICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+PiArICogQHBhc2lk
OiBwYXNpZCB0byBiZSBmbHVzaAo+PiArICoKPj4gKyAqIEZsdXNoIHRoZSBUTEIgZm9yIHRoZSBy
ZXF1ZXN0ZWQgcGFzaWQuCj4+ICsgKi8KPj4gK3N0YXRpYyBpbnQgZ21jX3Y5XzBfZmx1c2hfZ3B1
X3RsYl9wYXNpZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPj4gKwkJCQkJdWludDE2X3Qg
cGFzaWQsIHVpbnQzMl90IGZsdXNoX3R5cGUsCj4+ICsJCQkJCWJvb2wgYWxsX2h1YikKPj4gK3sK
Pj4gKwlpbnQgdm1pZCwgaTsKPj4gKwlzaWduZWQgbG9uZyByOwo+PiArCXVpbnQzMl90IHNlcTsK
Pj4gKwl1aW50MTZfdCBxdWVyaWVkX3Bhc2lkOwo+PiArCWJvb2wgcmV0Owo+PiArCXN0cnVjdCBh
bWRncHVfcmluZyAqcmluZyA9ICZhZGV2LT5nZngua2lxLnJpbmc7Cj4+ICsJc3RydWN0IGFtZGdw
dV9raXEgKmtpcSA9ICZhZGV2LT5nZngua2lxOwo+PiArCj4+ICsJaWYgKGFkZXYtPmluX2dwdV9y
ZXNldCkKPj4gKwkJcmV0dXJuIC1FSU87Cj4+ICsKPj4gKwlpZiAocmluZy0+c2NoZWQucmVhZHkp
IHsKPj4gKwkJc3Bpbl9sb2NrKCZhZGV2LT5nZngua2lxLnJpbmdfbG9jayk7Cj4+ICsJCWFtZGdw
dV9yaW5nX2FsbG9jKHJpbmcsIGtpcS0+cG1mLT5pbnZhbGlkYXRlX3RsYnNfc2l6ZSk7Cj4gU2Ft
ZSBhcyBhYm92ZS4KPgo+IFJlZ2FyZHMsCj4gICDCoCBGZWxpeAo+Cj4+ICsJCWtpcS0+cG1mLT5r
aXFfaW52YWxpZGF0ZV90bGJzKHJpbmcsCj4+ICsJCQkJCXBhc2lkLCBmbHVzaF90eXBlLCBhbGxf
aHViKTsKPj4gKwkJYW1kZ3B1X2ZlbmNlX2VtaXRfcG9sbGluZyhyaW5nLCAmc2VxKTsKPj4gKwkJ
YW1kZ3B1X3JpbmdfY29tbWl0KHJpbmcpOwo+PiArCQlzcGluX3VubG9jaygmYWRldi0+Z2Z4Lmtp
cS5yaW5nX2xvY2spOwo+PiArCQlyID0gYW1kZ3B1X2ZlbmNlX3dhaXRfcG9sbGluZyhyaW5nLCBz
ZXEsIGFkZXYtPnVzZWNfdGltZW91dCk7Cj4+ICsJCWlmIChyIDwgMSkgewo+PiArCQkJRFJNX0VS
Uk9SKCJ3YWl0IGZvciBraXEgZmVuY2UgZXJyb3I6ICVsZC5cbiIsIHIpOwo+PiArCQkJcmV0dXJu
IC1FVElNRTsKPj4gKwkJfQo+PiArCj4+ICsJCXJldHVybiAwOwo+PiArCX0KPj4gKwo+PiArCWZv
ciAodm1pZCA9IDE7IHZtaWQgPCAxNjsgdm1pZCsrKSB7Cj4+ICsKPj4gKwkJcmV0ID0gZ21jX3Y5
XzBfZ2V0X2F0Y192bWlkX3Bhc2lkX21hcHBpbmdfaW5mbyhhZGV2LCB2bWlkLAo+PiArCQkJCSZx
dWVyaWVkX3Bhc2lkKTsKPj4gKwkJaWYgKHJldCAmJiBxdWVyaWVkX3Bhc2lkID09IHBhc2lkKSB7
Cj4+ICsJCQlpZiAoYWxsX2h1Yikgewo+PiArCQkJCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5udW1f
dm1odWJzOyBpKyspCj4+ICsJCQkJCWdtY192OV8wX2ZsdXNoX2dwdV90bGIoYWRldiwgdm1pZCwK
Pj4gKwkJCQkJCQlpLCAwKTsKPj4gKwkJCX0gZWxzZSB7Cj4+ICsJCQkJZ21jX3Y5XzBfZmx1c2hf
Z3B1X3RsYihhZGV2LCB2bWlkLAo+PiArCQkJCQkJQU1ER1BVX0dGWEhVQl8wLCAwKTsKPj4gKwkJ
CX0KPj4gKwkJCWJyZWFrOwo+PiArCQl9Cj4+ICsJfQo+PiArCj4+ICsJcmV0dXJuIDA7Cj4+ICsK
Pj4gK30KPj4gKwo+PiAgICBzdGF0aWMgdWludDY0X3QgZ21jX3Y5XzBfZW1pdF9mbHVzaF9ncHVf
dGxiKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywKPj4gICAgCQkJCQkgICAgdW5zaWduZWQgdm1p
ZCwgdWludDY0X3QgcGRfYWRkcikKPj4gICAgewo+PiBAQCAtNzAwLDYgKzc3NSw3IEBAIHN0YXRp
YyB2b2lkIGdtY192OV8wX2dldF92bV9wdGUoc3RydWN0Cj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYs
Cj4+ICAgIAo+PiAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9nbWNfZnVuY3MgZ21jX3Y5
XzBfZ21jX2Z1bmNzID0gewo+PiAgICAJLmZsdXNoX2dwdV90bGIgPSBnbWNfdjlfMF9mbHVzaF9n
cHVfdGxiLAo+PiArCS5mbHVzaF9ncHVfdGxiX3Bhc2lkID0gZ21jX3Y5XzBfZmx1c2hfZ3B1X3Rs
Yl9wYXNpZCwKPj4gICAgCS5lbWl0X2ZsdXNoX2dwdV90bGIgPSBnbWNfdjlfMF9lbWl0X2ZsdXNo
X2dwdV90bGIsCj4+ICAgIAkuZW1pdF9wYXNpZF9tYXBwaW5nID0gZ21jX3Y5XzBfZW1pdF9wYXNp
ZF9tYXBwaW5nLAo+PiAgICAJLm1hcF9tdHlwZSA9IGdtY192OV8wX21hcF9tdHlwZSwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
