Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DAD14312D
	for <lists+amd-gfx@lfdr.de>; Mon, 20 Jan 2020 18:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43506EAB6;
	Mon, 20 Jan 2020 17:58:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4056EAB6
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 Jan 2020 17:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzPMKrQX9Nfcn5cZB9YFqNm0jU0AxTRcpYyhNCnGSLvSn5JzhlYvAdYJeOg2pGmwiBjK5G3mUxiekIwe5E6Bg1cH/leVeJdSex8NtKaq6Dzg8/qiISbe8CW3/VAYrmD3cV9xGKHP+h4eX0wNPm5NwL1ZxA0YQz2FN2jXwOtywPBN+I77mzTZFeTBf+KEwqL8jEvZ61bD4fgD3Ctj3lzlZWBD4HoZvr/x37LjCYYlwZqcxhKswtEzxPg7AqBEwohEe4nk3JWZwy31Tg1eyRKlXeqihIsXzHx/sGSSjuoMMLlpFYmmY7i6M7w3tuhxhu0TR8GBc6ATWG2R4+nv4/S5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLt5bsApKz3AUdvX9lVwlX+eH0pQjmW4CmqRuzikgEU=;
 b=AlunVmXYOPzOusPacobKyDWZ+S9kB9Y6BwmupNVDCP4Af1QSFp7//cufSA2YrvugXVoAiN7yohHRGw1kNLvZQzwdQC/3ZqxOi2KDef6KBB4hR2jmcCjlxHPWx6twxUjqk6gTu6aaeqcbIp5muD8vcp6jlCwkEmidaLf2S+fwZKdSV7vtoDp6hm8g9Xi1EY1LBiuNdwTI0BDDECaxHaKfF+Xd9oQAnp/Z97xCUJrVBJieX5WOABliCH3NFBp4GR8+sQO7/chjyyuzxEmhZ9rGliQRP1AYyfrlJNs76bvmOcQUnqSf6PzZBXIptlrpugcyIiaXn8tiG9EsmG3715HhSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLt5bsApKz3AUdvX9lVwlX+eH0pQjmW4CmqRuzikgEU=;
 b=UTtfY/hFbjtH4bFP3vvXgd2xuz6NTzt9IhB95zkmfDKEeX4ailPxV9SQXkXKjBSnUM4+kIrPIFfjQcsqqCJ0kpQJSmtCqbnZSEtc66LJIdl7Pgk6y98R7Ko5XlO8zj+cOhxAPTosR1hylrlpaUxnQTDYDu33nZiwjCoI2K2kEpI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
Received: from DM5PR1201MB0090.namprd12.prod.outlook.com (10.174.105.140) by
 DM5PR1201MB2522.namprd12.prod.outlook.com (10.172.92.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Mon, 20 Jan 2020 17:58:23 +0000
Received: from DM5PR1201MB0090.namprd12.prod.outlook.com
 ([fe80::7119:ff0:b3eb:619c]) by DM5PR1201MB0090.namprd12.prod.outlook.com
 ([fe80::7119:ff0:b3eb:619c%4]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 17:58:23 +0000
Subject: Re: [PATCH 3/3] drm/amdgpu: Improve Vega20 XGMI TLB flush workaround
To: shaoyunl <shaoyun.liu@amd.com>, amd-gfx@lists.freedesktop.org
References: <20200118013735.19361-1-Felix.Kuehling@amd.com>
 <20200118013735.19361-3-Felix.Kuehling@amd.com>
 <a5e68594-5350-d234-85a9-790364d864ec@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <ce87737e-7d4c-3123-4109-93be148a61aa@amd.com>
Date: Mon, 20 Jan 2020 12:58:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <a5e68594-5350-d234-85a9-790364d864ec@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::38) To DM5PR1201MB0090.namprd12.prod.outlook.com
 (2603:10b6:4:53::12)
MIME-Version: 1.0
Received: from [172.27.226.80] (165.204.55.251) by
 YTXPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.19 via Frontend
 Transport; Mon, 20 Jan 2020 17:58:22 +0000
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6464fed8-263c-4d0e-4462-08d79dd25743
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2522:|DM5PR1201MB2522:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2522217B11DABBBDA43728C492320@DM5PR1201MB2522.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0288CD37D9
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(8676002)(5660300002)(186003)(16526019)(26005)(8936002)(316002)(81156014)(81166006)(44832011)(53546011)(2616005)(956004)(6486002)(31686004)(66946007)(36916002)(2906002)(36756003)(66556008)(478600001)(31696002)(66476007)(16576012)(52116002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2522;
 H:DM5PR1201MB0090.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cC7qw0mW2WKhKN8GRNO2kbKS898SMnURKFJy56dLb0idhLmM6Wjk+xSSsF1dAP/vp8w+zQBA/rU6efyoAsCfW1DpdONJvuVD2dbVnFUSF7C0CEzURclm9AtIwXMqSW+QrMnbSJ2UjaH9JO5BuBUqrj2W1uDbwUz3O4/gIirdycsav+oFPWdgSZOSIDd7MiCJZXJFwrxgwUiomECxxgLmZB9sPR0MxBBjA8Xg6AsYpHYEOx35CjmAs8Bbl/iyMuWDv/8aU+5InV727XffsGfaHLa0KVzbAua56rS0wBgcnntFYRoizK3ClpwS9oxPeQfplY8hcFq2N2q78cxdvHCiLgVCMxgMQHUGT0R9ys2aFBDwuey2445UJHl4oZ1wfa6Z34WxYKaWnstyXZDguGRXfO6AyNb3KhMWljZ7AMWx9QNvX7W2pI2WjpV8Lmmy175G
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6464fed8-263c-4d0e-4462-08d79dd25743
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2020 17:58:23.1132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHwKdaDITBMqFZjM5IdOzLaXtQBnYQG/OZQ3Bmsa782T/WbPYQu8nPlrpLhACKE9pqPpvhjHYXx4qO1W93LOPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2522
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

T24gMjAyMC0wMS0yMCAxMjo0NyBwLm0uLCBzaGFveXVubCB3cm90ZToKPiBjb21tZW50cyBpbiBs
aW5lIC4KPgo+IE9uIDIwMjAtMDEtMTcgODozNyBwLm0uLCBGZWxpeCBLdWVobGluZyB3cm90ZToK
Pj4gVXNpbmcgYSBoZWF2eS13ZWlnaHQgVExCIGZsdXNoIG9uY2UgaXMgbm90IHN1ZmZpY2llbnQu
IENvbmN1cnJlbnQKPj4gbWVtb3J5IGFjY2Vzc2VzIGluIHRoZSBzYW1lIFRMQiBjYWNoZSBsaW5l
IGNhbiByZS1wb3B1bGF0ZSBUTEIgZW50cmllcwo+PiBmcm9tIHN0YWxlIHRleHR1cmUgY2FjaGUg
KFRDKSBlbnRyaWVzIHdoaWxlIHRoZSBoZWF2eS13ZWlnaHQgVExCCj4+IGZsdXNoIGlzIGluIHBy
b2dyZXNzLiBUbyBmaXggdGhpcyByYWNlIGNvbmRpdGlvbiwgcGVyZm9ybSBhbm90aGVyIFRMQgo+
PiBmbHVzaCBhZnRlciB0aGUgaGVhdnktd2VpZ2h0IG9uZSwgd2hlbiBUQyBpcyBrbm93biB0byBi
ZSBjbGVhbi4KPj4KPj4gTW92ZSB0aGUgd29ya2Fyb3VuZCBpbnRvIHRoZSBsb3ctbGV2ZWwgVExC
IGZsdXNoaW5nIGZ1bmN0aW9ucy4gVGhpcyB3YXkKPj4gdGhleSBhcHBseSB0byBhbWRncHUgYXMg
d2VsbCwgYW5kIEtJUS1iYXNlZCBUTEIgZmx1c2ggb25seSBuZWVkcyB0bwo+PiBzeW5jaHJvbml6
ZSBvbmNlLgo+Pgo+PiBDQzogc2hhb3l1bi5saXVAYW1kLmNvbQo+PiBTaWduZWQtb2ZmLWJ5OiBG
ZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyB8wqAgNiArLQo+PiDCoCBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jwqDCoMKgwqDCoCB8IDY4ICsrKysrKysr
KysrKysrKysrLS0tLS0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAy
MSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmQuYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkLmMKPj4gaW5kZXggODYwOTI4NzYyMGVhLi41MzI1ZjZiNDU1ZjYgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYwo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMKPj4gQEAgLTY0Nywx
MyArNjQ3LDkgQEAgaW50IGFtZGdwdV9hbWRrZmRfZmx1c2hfZ3B1X3RsYl92bWlkKHN0cnVjdCAK
Pj4ga2dkX2RldiAqa2dkLCB1aW50MTZfdCB2bWlkKQo+PiDCoCBpbnQgYW1kZ3B1X2FtZGtmZF9m
bHVzaF9ncHVfdGxiX3Bhc2lkKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHVpbnQxNl90IAo+PiBwYXNp
ZCkKPj4gwqAgewo+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0
cnVjdCBhbWRncHVfZGV2aWNlICopa2dkOwo+PiAtwqDCoMKgIHVpbnQzMl90IGZsdXNoX3R5cGUg
PSAwOwo+PiArwqDCoMKgIGNvbnN0IHVpbnQzMl90IGZsdXNoX3R5cGUgPSAwOwo+PiDCoMKgwqDC
oMKgIGJvb2wgYWxsX2h1YiA9IGZhbHNlOwo+PiDCoCAtwqDCoMKgIGlmIChhZGV2LT5nbWMueGdt
aS5udW1fcGh5c2ljYWxfbm9kZXMgJiYKPj4gLcKgwqDCoMKgwqDCoMKgIGFkZXYtPmFzaWNfdHlw
ZSA9PSBDSElQX1ZFR0EyMCkKPj4gLcKgwqDCoMKgwqDCoMKgIGZsdXNoX3R5cGUgPSAyOwo+PiAt
Cj4+IMKgwqDCoMKgwqAgaWYgKGFkZXYtPmZhbWlseSA9PSBBTURHUFVfRkFNSUxZX0FJKQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgYWxsX2h1YiA9IHRydWU7Cj4+IMKgIGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMKPj4gaW5kZXggOTAyMTZhYmYxNGE0Li5lMmE1ZTg1MmJkYjAg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwo+PiBAQCAtNDc2LDEz
ICs0NzYsMjYgQEAgc3RhdGljIHZvaWQgZ21jX3Y5XzBfZmx1c2hfZ3B1X3RsYihzdHJ1Y3QgCj4+
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsCj4+IMKgIHsKPj4gwqDCoMKgwqDC
oCBib29sIHVzZV9zZW1hcGhvcmUgPSBnbWNfdjlfMF91c2VfaW52YWxpZGF0ZV9zZW1hcGhvcmUo
YWRldiwgCj4+IHZtaHViKTsKPj4gwqDCoMKgwqDCoCBjb25zdCB1bnNpZ25lZCBlbmcgPSAxNzsK
Pj4gLcKgwqDCoCB1MzIgaiwgaW52X3JlcSwgdG1wOwo+PiArwqDCoMKgIHUzMiBqLCBpbnZfcmVx
LCBpbnZfcmVxMiwgdG1wOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfdm1odWIgKmh1YjsK
Pj4gwqAgwqDCoMKgwqDCoCBCVUdfT04odm1odWIgPj0gYWRldi0+bnVtX3ZtaHVicyk7Cj4+IMKg
IMKgwqDCoMKgwqAgaHViID0gJmFkZXYtPnZtaHViW3ZtaHViXTsKPj4gLcKgwqDCoCBpbnZfcmVx
ID0gZ21jX3Y5XzBfZ2V0X2ludmFsaWRhdGVfcmVxKHZtaWQsIGZsdXNoX3R5cGUpOwo+PiArwqDC
oMKgIGlmIChhZGV2LT5nbWMueGdtaS5udW1fcGh5c2ljYWxfbm9kZXMgJiYKPj4gK8KgwqDCoMKg
wqDCoMKgIGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1ZFR0EyMCkgewo+PiArwqDCoMKgwqDCoMKg
wqAgLyogVmVnYTIwK1hHTUkgY2FjaGVzIFBURXMgaW4gVEMgYW5kIFRMQi4gQWRkIGEKPj4gK8Kg
wqDCoMKgwqDCoMKgwqAgKiBoZWF2eS13ZWlnaHQgVExCIGZsdXNoICh0eXBlIDIpLCB3aGljaCBm
bHVzaGVzCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogYm90aC4gRHVlIHRvIGEgcmFjZSBjb25kaXRp
b24gd2l0aCBjb25jdXJyZW50Cj4+ICvCoMKgwqDCoMKgwqDCoMKgICogbWVtb3J5IGFjY2Vzc2Vz
IHVzaW5nIHRoZSBzYW1lIFRMQiBjYWNoZSBsaW5lLCB3ZQo+PiArwqDCoMKgwqDCoMKgwqDCoCAq
IHN0aWxsIG5lZWQgYSBzZWNvbmQgVExCIGZsdXNoIGFmdGVyIHRoaXMuCj4+ICvCoMKgwqDCoMKg
wqDCoMKgICovCj4+ICvCoMKgwqDCoMKgwqDCoCBpbnZfcmVxID0gZ21jX3Y5XzBfZ2V0X2ludmFs
aWRhdGVfcmVxKHZtaWQsIDIpOwo+PiArwqDCoMKgwqDCoMKgwqAgaW52X3JlcTIgPSBnbWNfdjlf
MF9nZXRfaW52YWxpZGF0ZV9yZXEodm1pZCwgZmx1c2hfdHlwZSk7Cj4KPiBbc2hhb3l1bmxdwqAg
Rm9yIHRoZSBzZW5kIGludmFsaWRhdGlvbiBpbiB0aGlzIHNpdHVhdGlvbiAsY2FuIHdlIHVzZSAw
wqAgCj4gZm9yIHRoZSBmbHVzaCB0eXBlIGRpcmVjdGx5ID8gSSB0aGluayBubyBtYXR0ZXIgd2hh
dCdzIHRoZSBpbnB1dCAKPiBmbHVzaF90eXBlIGZvciB0aGlzIGZ1bmN0aW9uICwgaGVhdnktd2Vp
Z2h0wqAgKyBsZWdhY3kgaW52YWxpZGF0aW9uIAo+IHNob3VsZCBiZSBlbm91Z2ggZm9yIGFsbCBv
ZiB0aGVtIC4KCkknbSBub3Qgc3VyZSB0aGF0J3MgdHJ1ZS4gSW4gdGhlIGNhc2Ugb2YgdGhlIHJh
Y2UgY29uZGl0aW9uLCB0aGVyZSB3YXMgCnNvbWUgY29uY3VycmVudCBtZW1vcnkgYWNjZXNzIGR1
cmluZyB0aGUgZmlyc3QgaGVhdnktd2VpZ2h0IAppbnZhbGlkYXRpb24uIElmIHRoYXQgaXMgbm93
IGZsdXNoZWQgaW4gdGhlIHNlY29uZCBpbnZhbGlkYXRpb24sIGFuZCBhIApoZWF2eS13ZWlnaHQg
aW52YWxpZGF0aW9uIHdhcyByZXF1ZXN0ZWQsIHdlIHNob3VsZCBhbHNvIGZsdXNoIGFueSBUQyAK
Y2FjaGUgbGluZXMgYXNzb2NpYXRlZCB3aXRoIHRoYXQgYWNjZXNzLiBTbyBoYXJkLWNvZGluZyBm
bHVzaF90eXBlIDAgCmhlcmUgaXMgcHJvYmFibHkgbm90IHNhZmUgZm9yIGFsbCBjYXNlcy4KClJl
Z2FyZHMsCiDCoCBGZWxpeAoKCj4KPj4gK8KgwqDCoCB9IGVsc2Ugewo+PiArwqDCoMKgwqDCoMKg
wqAgaW52X3JlcSA9IGdtY192OV8wX2dldF9pbnZhbGlkYXRlX3JlcSh2bWlkLCBmbHVzaF90eXBl
KTsKPj4gK8KgwqDCoMKgwqDCoMKgIGludl9yZXEyID0gMDsKPj4gK8KgwqDCoCB9Cj4+IMKgIMKg
wqDCoMKgwqAgLyogVGhpcyBpcyBuZWNlc3NhcnkgZm9yIGEgSFcgd29ya2Fyb3VuZCB1bmRlciBT
UklPViBhcyB3ZWxsCj4+IMKgwqDCoMKgwqDCoCAqIGFzIEdGWE9GRiB1bmRlciBiYXJlIG1ldGFs
Cj4+IEBAIC01MjEsMjEgKzUzNCwyNyBAQCBzdGF0aWMgdm9pZCBnbWNfdjlfMF9mbHVzaF9ncHVf
dGxiKHN0cnVjdCAKPj4gYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgdm1pZCwKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX0VSUk9SKCJUaW1lb3V0IHdhaXRpbmcgZm9yIHNl
bSBhY3F1aXJlIGluIFZNIAo+PiBmbHVzaCFcbiIpOwo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgLcKg
wqDCoCBXUkVHMzJfTk9fS0lRKGh1Yi0+dm1faW52X2VuZzBfcmVxICsgZW5nLCBpbnZfcmVxKTsK
Pj4gK8KgwqDCoCBkbyB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBXUkVHMzJfTk9fS0lRKGh1Yi0+dm1f
aW52X2VuZzBfcmVxICsgZW5nLCBpbnZfcmVxKTsKPj4gwqAgLcKgwqDCoCAvKgo+PiAtwqDCoMKg
wqAgKiBJc3N1ZSBhIGR1bW15IHJlYWQgdG8gd2FpdCBmb3IgdGhlIEFDSyByZWdpc3RlciB0byBi
ZSBjbGVhcmVkCj4+IC3CoMKgwqDCoCAqIHRvIGF2b2lkIGEgZmFsc2UgQUNLIGR1ZSB0byB0aGUg
bmV3IGZhc3QgR1JCTSBpbnRlcmZhY2UuCj4+IC3CoMKgwqDCoCAqLwo+PiAtwqDCoMKgIGlmICh2
bWh1YiA9PSBBTURHUFVfR0ZYSFVCXzApCj4+IC3CoMKgwqDCoMKgwqDCoCBSUkVHMzJfTk9fS0lR
KGh1Yi0+dm1faW52X2VuZzBfcmVxICsgZW5nKTsKPj4gK8KgwqDCoMKgwqDCoMKgIC8qCj4+ICvC
oMKgwqDCoMKgwqDCoMKgICogSXNzdWUgYSBkdW1teSByZWFkIHRvIHdhaXQgZm9yIHRoZSBBQ0sg
cmVnaXN0ZXIgdG8KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBiZSBjbGVhcmVkIHRvIGF2b2lkIGEg
ZmFsc2UgQUNLIGR1ZSB0byB0aGUgbmV3IGZhc3QKPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBHUkJN
IGludGVyZmFjZS4KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIGlm
ICh2bWh1YiA9PSBBTURHUFVfR0ZYSFVCXzApCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJS
RUczMl9OT19LSVEoaHViLT52bV9pbnZfZW5nMF9yZXEgKyBlbmcpOwo+PiDCoCAtwqDCoMKgIGZv
ciAoaiA9IDA7IGogPCBhZGV2LT51c2VjX3RpbWVvdXQ7IGorKykgewo+PiAtwqDCoMKgwqDCoMKg
wqAgdG1wID0gUlJFRzMyX05PX0tJUShodWItPnZtX2ludl9lbmcwX2FjayArIGVuZyk7Cj4+IC3C
oMKgwqDCoMKgwqDCoCBpZiAodG1wICYgKDEgPDwgdm1pZCkpCj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGJyZWFrOwo+PiAtwqDCoMKgwqDCoMKgwqAgdWRlbGF5KDEpOwo+PiAtwqDCoMKgIH0K
Pj4gK8KgwqDCoMKgwqDCoMKgIGZvciAoaiA9IDA7IGogPCBhZGV2LT51c2VjX3RpbWVvdXQ7IGor
Kykgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0bXAgPSBSUkVHMzJfTk9fS0lRKGh1Yi0+
dm1faW52X2VuZzBfYWNrICsgZW5nKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHRt
cCAmICgxIDw8IHZtaWQpKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFr
Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1ZGVsYXkoMSk7Cj4+ICvCoMKgwqDCoMKgwqDC
oCB9Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIGludl9yZXEgPSBpbnZfcmVxMjsKPj4gK8KgwqDC
oMKgwqDCoMKgIGludl9yZXEyID0gMDsKPj4gK8KgwqDCoCB9IHdoaWxlIChpbnZfcmVxKTsKPj4g
wqAgwqDCoMKgwqDCoCAvKiBUT0RPOiBJdCBuZWVkcyB0byBjb250aW51ZSB3b3JraW5nIG9uIGRl
YnVnZ2luZyB3aXRoIAo+PiBzZW1hcGhvcmUgZm9yIEdGWEhVQiBhcyB3ZWxsLiAqLwo+PiDCoMKg
wqDCoMKgIGlmICh1c2Vfc2VtYXBob3JlKQo+PiBAQCAtNTc3LDkgKzU5NiwyNiBAQCBzdGF0aWMg
aW50IGdtY192OV8wX2ZsdXNoX2dwdV90bGJfcGFzaWQoc3RydWN0IAo+PiBhbWRncHVfZGV2aWNl
ICphZGV2LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU87Cj4+IMKgIMKgwqDCoMKg
wqAgaWYgKHJpbmctPnNjaGVkLnJlYWR5KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBWZWdhMjAr
WEdNSSBjYWNoZXMgUFRFcyBpbiBUQyBhbmQgVExCLiBBZGQgYQo+PiArwqDCoMKgwqDCoMKgwqDC
oCAqIGhlYXZ5LXdlaWdodCBUTEIgZmx1c2ggKHR5cGUgMiksIHdoaWNoIGZsdXNoZXMKPj4gK8Kg
wqDCoMKgwqDCoMKgwqAgKiBib3RoLiBEdWUgdG8gYSByYWNlIGNvbmRpdGlvbiB3aXRoIGNvbmN1
cnJlbnQKPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBtZW1vcnkgYWNjZXNzZXMgdXNpbmcgdGhlIHNh
bWUgVExCIGNhY2hlIGxpbmUsIHdlCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogc3RpbGwgbmVlZCBh
IHNlY29uZCBUTEIgZmx1c2ggYWZ0ZXIgdGhpcy4KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8KPj4g
K8KgwqDCoMKgwqDCoMKgIGJvb2wgdmVnYTIwX3hnbWlfd2EgPSAoYWRldi0+Z21jLnhnbWkubnVt
X3BoeXNpY2FsX25vZGVzICYmCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdBMjApOwo+PiArwqDCoMKgwqDC
oMKgwqAgLyogMiBkd29yZHMgZmx1c2ggKyA4IGR3b3JkcyBmZW5jZSAqLwo+PiArwqDCoMKgwqDC
oMKgwqAgdW5zaWduZWQgaW50IG5kdyA9IGtpcS0+cG1mLT5pbnZhbGlkYXRlX3RsYnNfc2l6ZSAr
IDg7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICh2ZWdhMjBfeGdtaV93YSkKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbmR3ICs9IGtpcS0+cG1mLT5pbnZhbGlkYXRlX3RsYnNfc2l6ZTsK
Pj4gKwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZhZGV2LT5nZngua2lxLnJpbmdf
bG9jayk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKiAyIGR3b3JkcyBmbHVzaCArIDggZHdvcmRz
IGZlbmNlICovCj4+IC3CoMKgwqDCoMKgwqDCoCBhbWRncHVfcmluZ19hbGxvYyhyaW5nLCBraXEt
PnBtZi0+aW52YWxpZGF0ZV90bGJzX3NpemUgKyA4KTsKPj4gK8KgwqDCoMKgwqDCoMKgIGFtZGdw
dV9yaW5nX2FsbG9jKHJpbmcsIG5kdyk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAodmVnYTIwX3hn
bWlfd2EpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGtpcS0+cG1mLT5raXFfaW52YWxpZGF0
ZV90bGJzKHJpbmcsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHBhc2lkLCAyLCBhbGxfaHViKTsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGtpcS0+cG1mLT5raXFfaW52YWxpZGF0ZV90bGJzKHJpbmcsCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYXNpZCwgZmx1c2hfdHlwZSwgYWxsX2h1Yik7
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBhbWRncHVfZmVuY2VfZW1pdF9wb2xsaW5nKHJpbmcsICZz
ZXEpOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
