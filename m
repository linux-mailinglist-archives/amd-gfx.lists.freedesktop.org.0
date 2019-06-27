Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A14A057D79
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 09:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E726E81C;
	Thu, 27 Jun 2019 07:50:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790084.outbound.protection.outlook.com [40.107.79.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D84F6E418
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 07:50:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=VvHNR5+bkU2Oe8xSQQd8Pp8HgZnORh4sIOpfVNSGi3WEcsD4k9/VDA3Vn6hZL/u9AyzXetlQsE/DriiHBDc+6QdD6rq2v4p5XqDUjiR+TVIm+VPQfakuTzpRFHBsPMnpN7QTJnzsGhTNW1GC4vkgsDHIHkQFQUa8KhJMTl3lofg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CW6VEUmMLkQoWj4MoVImVcgpnUmvku+tf4TaloE5X7U=;
 b=oK8qoxqPvZrwQ69ouqDJ9l+YWHL9fscO+AEGyU7LrAYukLmE4WtZYHaMzvJ8Q5V96CJTs8fbVcalSKQjWzQqjw7pg2dJMLV5djBugKOL2FBRoeEwHZ4WHbxzQQwdHvWJjSbgOv4n3FmkEJnetn8UX8Qh2CfqpToFWj6rMfdV31k=
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0042.namprd12.prod.outlook.com (2603:10b6:301:2::28)
 by CY4PR1201MB0022.namprd12.prod.outlook.com (2603:10b6:910:1e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Thu, 27 Jun
 2019 07:50:24 +0000
Received: from DM3NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by MWHPR12CA0042.outlook.office365.com
 (2603:10b6:301:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Thu, 27 Jun 2019 07:50:23 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT009.mail.protection.outlook.com (10.152.82.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2032.15 via Frontend Transport; Thu, 27 Jun 2019 07:50:23 +0000
Received: from [10.65.99.155] (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 27 Jun
 2019 02:50:21 -0500
Subject: Re: [PATCH 2/2] drm/amdgpu: handle
 AMDGPU_IB_FLAG_RESET_GDS_MAX_WAVE_ID on gfx10
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 <amd-gfx@lists.freedesktop.org>
References: <20190626223521.14347-1-maraeo@gmail.com>
 <20190626223521.14347-2-maraeo@gmail.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <b789da4a-2e31-31eb-4706-ea9b6fbc45c1@amd.com>
Date: Thu, 27 Jun 2019 15:50:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190626223521.14347-2-maraeo@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(77096007)(58126008)(486006)(65826007)(68736007)(6116002)(3846002)(110136005)(336012)(67846002)(316002)(16576012)(31696002)(72206003)(478600001)(47776003)(31686004)(6246003)(65956001)(65806001)(26005)(7736002)(305945005)(356004)(6666004)(81156014)(81166006)(126002)(70206006)(426003)(5660300002)(8676002)(16526019)(14444005)(2616005)(2486003)(2906002)(476003)(70586007)(2870700001)(64126003)(53936002)(229853002)(76176011)(36756003)(11346002)(8936002)(23676004)(446003)(186003)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0022; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b5f7d57-1b60-439a-26b4-08d6fad41c6e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0022; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0022:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00227611D7185D1BA3F3A836B4FD0@CY4PR1201MB0022.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 008184426E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: izh9Bj9A4ctsGGNOKmUKmCOiw8OpxYimdgmV3QXP93xb2vY7lChkXbER2Y3b/amFdTzSHQkFHHzHemws/3IIzvo/VnjaAEeapnd7a+kJxJooeDMobLyT+PM2Cu/9HUJUitP2i70VQanuyakO2n2TK3bodbu5CTxI289VYOf6S0N0ygJbu9Cox4sNTmC0pbCkuUZQPkhqhAWvj9lSRj10RZBoWM3OOpyegaF6bwO7rHRpvgwtWIjpTShyIPSzQA3zhRmYc4iP70UIoA1gBlcqmcxE6P+6rfJwv4cNBY5yfMgt/4FR+foYXCmWHNsTVulnIMZPIQ8wQKemvUBfptsaM1ygbuaXjDF88BMm/ZLHmrjEDip3LlRLACvtTrq8EF96w/vzMNJl0n99rwUUE0dHi/bp0TxrgiBWi0lEBAMWnt0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2019 07:50:23.4523 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5f7d57-1b60-439a-26b4-08d6fad41c6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0022
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CW6VEUmMLkQoWj4MoVImVcgpnUmvku+tf4TaloE5X7U=;
 b=RJVxxT+bRDObya0pr4E6ANMkAY9+xvUMiRvjlajewK9V0ts8kMeE7AyTKmYT2c2qrbtbVmrQ+iLp3TikYOm+JMOj4SBUwgA8s45KOo1RxdOnQIm9tYFCJl8ekpBRue/FscEK1kmbq8WhsFSMwO3EmDrzOyAY5yTDUoE1EJ9X1KU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YW55IHJlYXNvbiBmb3Igbm90IGNhcmUgLmVtaXRfaWJfc2l6ZSBpbiB0aGlzIG9uZT8KCi1EYXZp
ZAoKCk9uIDIwMTnlubQwNuaciDI35pelIDA2OjM1LCBNYXJlayBPbMWhw6FrIHdyb3RlOgo+IEZy
b206IE1hcmVrIE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFtZC5jb20+Cj4KPiBTaWduZWQtb2ZmLWJ5
OiBNYXJlayBPbMWhw6FrIDxtYXJlay5vbHNha0BhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCAxNyArKysrKysrKysrKysrKysrKwo+ICAg
MSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92MTBfMC5jCj4gaW5kZXggNmJhYWE2NWExZGFhLi41YjgwN2ExOWJiYmYgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwo+IEBAIC00MjU3LDIwICs0MjU3
LDM2IEBAIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9yaW5nX2VtaXRfaWJfZ2Z4KHN0cnVjdCBhbWRn
cHVfcmluZyAqcmluZywKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3Jpbmdf
ZW1pdF9pYl9jb21wdXRlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywKPiAgIAkJCQkJICAgc3Ry
dWN0IGFtZGdwdV9qb2IgKmpvYiwKPiAgIAkJCQkJICAgc3RydWN0IGFtZGdwdV9pYiAqaWIsCj4g
ICAJCQkJCSAgIHVpbnQzMl90IGZsYWdzKQo+ICAgewo+ICAgCXVuc2lnbmVkIHZtaWQgPSBBTURH
UFVfSk9CX0dFVF9WTUlEKGpvYik7Cj4gICAJdTMyIGNvbnRyb2wgPSBJTkRJUkVDVF9CVUZGRVJf
VkFMSUQgfCBpYi0+bGVuZ3RoX2R3IHwgKHZtaWQgPDwgMjQpOwo+ICAgCj4gKwkvKiBDdXJyZW50
bHksIHRoZXJlIGlzIGEgaGlnaCBwb3NzaWJpbGl0eSB0byBnZXQgd2F2ZSBJRCBtaXNtYXRjaAo+
ICsJICogYmV0d2VlbiBNRSBhbmQgR0RTLCBsZWFkaW5nIHRvIGEgaHcgZGVhZGxvY2ssIGJlY2F1
c2UgTUUgZ2VuZXJhdGVzCj4gKwkgKiBkaWZmZXJlbnQgd2F2ZSBJRHMgdGhhbiB0aGUgR0RTIGV4
cGVjdHMuIFRoaXMgc2l0dWF0aW9uIGhhcHBlbnMKPiArCSAqIHJhbmRvbWx5IHdoZW4gYXQgbGVh
c3QgNSBjb21wdXRlIHBpcGVzIHVzZSBHRFMgb3JkZXJlZCBhcHBlbmQuCj4gKwkgKiBUaGUgd2F2
ZSBJRHMgZ2VuZXJhdGVkIGJ5IE1FIGFyZSBhbHNvIHdyb25nIGFmdGVyIHN1c3BlbmQvcmVzdW1l
Lgo+ICsJICogVGhvc2UgYXJlIHByb2JhYmx5IGJ1Z3Mgc29tZXdoZXJlIGVsc2UgaW4gdGhlIGtl
cm5lbCBkcml2ZXIuCj4gKwkgKgo+ICsJICogV3JpdGluZyBHRFNfQ09NUFVURV9NQVhfV0FWRV9J
RCByZXNldHMgd2F2ZSBJRCBjb3VudGVycyBpbiBNRSBhbmQKPiArCSAqIEdEUyB0byAwIGZvciB0
aGlzIHJpbmcgKG1lL3BpcGUpLgo+ICsJICovCj4gKwlpZiAoaWItPmZsYWdzICYgQU1ER1BVX0lC
X0ZMQUdfUkVTRVRfR0RTX01BWF9XQVZFX0lEKSB7Cj4gKwkJYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgUEFDS0VUMyhQQUNLRVQzX1NFVF9DT05GSUdfUkVHLCAxKSk7Cj4gKwkJYW1kZ3B1X3Jpbmdf
d3JpdGUocmluZywgbW1HRFNfQ09NUFVURV9NQVhfV0FWRV9JRCk7Cj4gKwkJYW1kZ3B1X3Jpbmdf
d3JpdGUocmluZywgcmluZy0+YWRldi0+Z2RzLmdkc19jb21wdXRlX21heF93YXZlX2lkKTsKPiAr
CX0KPiArCj4gICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUMyhQQUNLRVQzX0lORElS
RUNUX0JVRkZFUiwgMikpOwo+ICAgCUJVR19PTihpYi0+Z3B1X2FkZHIgJiAweDMpOyAvKiBEd29y
ZCBhbGlnbiAqLwo+ICAgCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsCj4gICAjaWZkZWYgX19CSUdf
RU5ESUFOCj4gICAJCQkJKDIgPDwgMCkgfAo+ICAgI2VuZGlmCj4gICAJCQkJbG93ZXJfMzJfYml0
cyhpYi0+Z3B1X2FkZHIpKTsKPiAgIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCB1cHBlcl8zMl9i
aXRzKGliLT5ncHVfYWRkcikpOwo+ICAgCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIGNvbnRyb2wp
Owo+ICAgfQo+IEBAIC01MTAzLDIwICs1MTE5LDIxIEBAIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9z
ZXRfcmxjX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgCX0KPiAgIH0KPiAg
IAo+ICAgc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3NldF9nZHNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKPiAgIHsKPiAgIAkvKiBpbml0IGFzaWMgZ2RzIGluZm8gKi8KPiAgIAlzd2l0
Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewo+ICAgCWNhc2UgQ0hJUF9OQVZJMTA6Cj4gICAJZGVmYXVs
dDoKPiAgIAkJYWRldi0+Z2RzLmdkc19zaXplID0gMHgxMDAwMDsKPiArCQlhZGV2LT5nZHMuZ2Rz
X2NvbXB1dGVfbWF4X3dhdmVfaWQgPSAweDRmZjsKPiAgIAkJYWRldi0+Z2RzLnZndF9nc19tYXhf
d2F2ZV9pZCA9IDB4M2ZmOwo+ICAgCQlicmVhazsKPiAgIAl9Cj4gICAKPiAgIAlhZGV2LT5nZHMu
Z3dzX3NpemUgPSA2NDsKPiAgIAlhZGV2LT5nZHMub2Ffc2l6ZSA9IDE2Owo+ICAgfQo+ICAgCj4g
ICBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfc2V0X3VzZXJfd2dwX2luYWN0aXZlX2JpdG1hcF9wZXJf
c2goc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAJCQkJCQkJICB1MzIgYml0bWFwKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
