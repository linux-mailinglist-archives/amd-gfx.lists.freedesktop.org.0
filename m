Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E001188F5
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Dec 2019 13:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0FA6E8E1;
	Tue, 10 Dec 2019 12:56:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770071.outbound.protection.outlook.com [40.107.77.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACB66E89C
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Dec 2019 12:56:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FE8FqPkEttXrXpSkNKNj8eh3McilV5OdoH+nazGyhuIM+K3juD4w40ulxl1Iaa6z+2Ychbm9SxuftPyg/FA6j+IVJLcExiZJ2ZnlOmGMTUsLEeUO4iHUIZOci33hKNS5maN2rSu8pRYmrO71Lk/McyiLTS960uKhX2twH1Q5WxwftNSN9Dd5o7F1ajwpg91qk4EEqyZtW3Agp1fR7q9OWkOYg24iqUDAaERTJQC62M+KDw+bSFjscERGghhbDngTYAMWka0iweQXBg3QF4qLTK+5zGOcpUoYmnlsieZkzrizBQWP5aWcvay1qBqE9TNEEoVvoQh4y5mmxXhTagq1Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2qC2jOWvdvqcEmH4NMut0le2fpKh38sdlkzvBDx/p4=;
 b=eNoRghEvMZ2zFf6Vbuu7jmjz+LdTln4kq5cFV8buZKD4/3RFQ5EZptk8Tq16/HjJ+eVDTCDD8lCYrg+63Qx8THPn/O48Q9YBNIKgKdKuk2I0jaCfyQ2TSDAbZgCCad0ed+8U9bOVtquHSlO8LLUYpLivcCFBuwrmxCYd85Qv4iuLFWfdHK+T9meuVbl5IYYAoSUTNrUh2mjo2rCDJV7EILSSRf/lKirr6EHL+b4g/ZukkWg0aDD0F5oysovrmClcn1NVvVIhPcystUJf1rdM3P00EfVeRcLvuDr/n2y8+5TC/xN3nm3iOKeETBEWkU0JWx9txf2kbbqAXVi/Wqlsug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2qC2jOWvdvqcEmH4NMut0le2fpKh38sdlkzvBDx/p4=;
 b=Q9B6V0twUQHNCysy6mJ0sZ/0NWL/5q3P4hZTv+bc9kcAXjNImPbZiHDSeMDo0H1GXmfhzXzJpEZHx9qNCXrW27AgUc48blLgeSqCFrL2uR80fekUCSz6EdqtpOmf/Ai1il36A8KBuoO5AqRxErVU2feS8+qnu5bO9BNJiaH9TuI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2407.namprd12.prod.outlook.com (52.132.141.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Tue, 10 Dec 2019 12:56:28 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84%12]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 12:56:28 +0000
Subject: Re: [PATCH 3/4] amd/amdgpu: add sched list to IPs with multiple
 run-queues
To: Nirmoy <nirmodas@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 alexander.deucher@amd.com, kenny.ho@amd.com
References: <20191209215349.26994-1-nirmoy.das@amd.com>
 <20191209215349.26994-3-nirmoy.das@amd.com>
 <f3af0e66-ed90-4d2c-9e7c-45441e7bc0d2@amd.com>
 <6942ecc7-7a42-2a77-7575-873a87192ada@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <14255a3c-5904-3d44-06ee-b095ba5bc27d@amd.com>
Date: Tue, 10 Dec 2019 13:56:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <6942ecc7-7a42-2a77-7575-873a87192ada@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR0402CA0033.eurprd04.prod.outlook.com
 (2603:10a6:208:15::46) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: df5d6ca8-352e-4e62-255e-08d77d705f13
X-MS-TrafficTypeDiagnostic: DM5PR12MB2407:|DM5PR12MB2407:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2407FBC1CBA0589B200D4BFD835B0@DM5PR12MB2407.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 02475B2A01
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(199004)(189003)(81166006)(6666004)(81156014)(66476007)(66946007)(30864003)(66556008)(8676002)(5660300002)(6512007)(4326008)(31696002)(8936002)(52116002)(86362001)(6486002)(53546011)(31686004)(2616005)(110136005)(36756003)(6506007)(478600001)(2906002)(316002)(6636002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2407;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4i5DlY4VylzzFTokKtLo0xr0R1CPPCfVZRunMVpBNX/b+5J3lf/LiXAU0cr6QHTa6o2p3JTK/LxmGwC+u4JjRukSyQ0p5DxHwq1F3tmMK0gixskG0al7UGoIlF+IEU7C8UxTKZwnWW/St84GxQz/Bbo1ISJAHqrsF6idhSnC7J3wQqpokT141YVkXSQJSRs3H54wApa83RRMSpedjQqqZ6KrCr36oNUG6Q3wvZohCh5vliNtGYEZmt3RGlrP57138rR6/kiaGD8ThLM44tiKa2OfGTmQEy54J4OFVh84eOnl0VaHFqHiPNZuXwswhaBhE2c0wt/vgtfHHXOo/tqzE84ANDBWbcQjl9gMBlPL7Yt8DG0nuYbjkOZ/DfHGU6il3HyKnQcm/36CHcYPXoqJ2hE35I9xVDOFunFuJKrjnieTYofR5CsYOhlIU+qYY+9S
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df5d6ca8-352e-4e62-255e-08d77d705f13
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 12:56:28.6611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qR6ZkapH5XZUCIMootdivQ7DAhl1BtUr8f1G472adOWtPoMz3Jk/qXtn29+iY/gM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2407
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
Cc: nirmoy.das@amd.com, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

WWVhaCwgYnV0IHlvdSBhcmUgdG8gZmFzdCBmb3IgbWUuIEkgd2FzIHN0aWxsIGxvb2tpbmcgaW50
byBjb21tZW50cyBmb3IgCnBhdGNoICM0IDopCgpDaHJpc3RpYW4uCgpBbSAxMC4xMi4xOSB1bSAx
Mzo1NSBzY2hyaWViIE5pcm1veToKPiBUaGFua3MgQ2hyaXN0aWFuLiBUaGF0IG1ha2Ugc2Vuc2Us
IHJlc2VudCBtb2RpZmllZCBwYXRjaGVzLgo+Cj4gT24gMTIvMTAvMTkgMTI6MjggUE0sIENocmlz
dGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDA5LjEyLjE5IHVtIDIyOjUzIHNjaHJpZWIgTmlybW95
IERhczoKPj4+IFRoaXMgc2NoZWQgbGlzdCBjYW4gYmUgcGFzc2VkIG9uIHRvIGVudGl0eSBjcmVh
dGlvbiByb3V0aW5lCj4+PiBpbnN0ZWFkIG9mIG1hbnVhbGx5IGNyZWF0aW5nIHN1Y2ggc2NoZWQg
bGlzdCBvbiBldmVyeSBjb250ZXh0IGNyZWF0aW9uLgo+Pgo+PiBQbGVhc2UgZHJvcCB0aGUgIl9s
aXN0IiBmcm9tIHRoZSBuYW1lcyBoZXJlLiBBIGxpc3QgdXN1YWxseSBtZWFucyBhIAo+PiBsaW5r
ZWQgbGlzdCBhbmQgdGhvc2UgYXJlIGFjdHVhbGx5IGFycmF5cy4KPj4KPj4gQWRkaXRpb25hbCB0
byB0aGF0IGFtZGdwdV9kZXZpY2VfaW5pdF9zY2hlZF9saXN0KCkgc2hvdWxkIHByb2JhYmx5IGdv
IAo+PiBpbnRvIGFtZGdwdV9jdHguYyBpbnN0ZWFkLiBUaGF0IGlzIGFjdHVhbGx5IG5vdCByZWFs
bHkgZGV2aWNlIAo+PiByZWxhdGVkLCBidXQgbW9yZSBVQVBJL2N0eCBzdHVmZi4KPj4KPj4gQXBh
cnQgZnJvbSB0aGF0IGxvb2tzIGdvb2QgdG8gbWUsCj4+IENocmlzdGlhbi4KPj4KPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+Cj4+PiAtLS0KPj4+
IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguY8KgwqDCoCB8IDY5IAo+
Pj4gKysrKysrKystLS0tLS0tLS0tLS0tLQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jIHwgNDQgKysrKysrKysrKysrKysKPj4+IMKgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaMKgwqDCoCB8wqAgNCArKwo+Pj4gwqAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pwZWcuaMKgwqAgfMKgIDIgKwo+Pj4gwqAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NkbWEuaMKgwqAgfMKgIDIgKwo+Pj4gwqAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5owqDCoMKgIHzCoCA5ICsrLQo+
Pj4gwqAgNiBmaWxlcyBjaGFuZ2VkLCA4NSBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkK
Pj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0
eC5jIAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKPj4+IGlu
ZGV4IDFkNjg1MGFmOTkwOC4uYzFmYzc1Mjk5YjdkIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKPj4+IEBAIC03NCw3ICs3NCw3IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X2N0eF9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlIAo+Pj4gKmFkZXYsCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2N0eCAqY3R4KQo+Pj4g
wqAgewo+Pj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBudW1fZW50aXRpZXMgPSBhbWRncHVfY3R4X3Rv
dGFsX251bV9lbnRpdGllcygpOwo+Pj4gLcKgwqDCoCB1bnNpZ25lZCBpLCBqLCBrOwo+Pj4gK8Kg
wqDCoCB1bnNpZ25lZCBpLCBqOwo+Pj4gwqDCoMKgwqDCoCBpbnQgcjsKPj4+IMKgIMKgwqDCoMKg
wqAgaWYgKHByaW9yaXR5IDwgMCB8fCBwcmlvcml0eSA+PSBEUk1fU0NIRURfUFJJT1JJVFlfTUFY
KQo+Pj4gQEAgLTEyMSw3MyArMTIxLDU2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2N0eF9pbml0KHN0
cnVjdCAKPj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+PiDCoMKgwqDCoMKgIGN0eC0+b3ZlcnJp
ZGVfcHJpb3JpdHkgPSBEUk1fU0NIRURfUFJJT1JJVFlfVU5TRVQ7Cj4+PiDCoCDCoMKgwqDCoMKg
IGZvciAoaSA9IDA7IGkgPCBBTURHUFVfSFdfSVBfTlVNOyArK2kpIHsKPj4+IC3CoMKgwqDCoMKg
wqDCoCBzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmdzW0FNREdQVV9NQVhfUklOR1NdOwo+Pj4gLcKg
wqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWRfbGlzdFtBTURHUFVf
TUFYX1JJTkdTXTsKPj4+IC3CoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBudW1fcmluZ3MgPSAwOwo+
Pj4gLcKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIG51bV9ycXMgPSAwOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqKnNjaGVkX2xpc3Q7Cj4+PiArwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZDsKPj4+ICvCoMKgwqDCoMKgwqDC
oCB1bnNpZ25lZCBudW1fc2NoZWRzID0gMDsKPj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBzd2l0
Y2ggKGkpIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIEFNREdQVV9IV19JUF9HRlg6Cj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByaW5nc1swXSA9ICZhZGV2LT5nZnguZ2Z4X3Jpbmdb
MF07Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBudW1fcmluZ3MgPSAxOwo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc2NoZWRfbGlzdCA9IGFkZXYtPmdmeC5nZnhfc2NoZWRfbGlzdDsK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG51bV9zY2hlZHMgPSAxOwo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2FzZSBBTURH
UFVfSFdfSVBfQ09NUFVURToKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciAoaiA9IDA7
IGogPCBhZGV2LT5nZngubnVtX2NvbXB1dGVfcmluZ3M7ICsraikKPj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmluZ3Nbal0gPSAmYWRldi0+Z2Z4LmNvbXB1dGVfcmluZ1tqXTsK
Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG51bV9yaW5ncyA9IGFkZXYtPmdmeC5udW1fY29t
cHV0ZV9yaW5nczsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNjaGVkX2xpc3QgPSBhZGV2
LT5nZnguY29tcHV0ZV9zY2hlZF9saXN0Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnVt
X3NjaGVkcyA9IGFkZXYtPmdmeC5udW1fY29tcHV0ZV9yaW5nczsKPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgQU1ER1BVX0hX
X0lQX0RNQToKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciAoaiA9IDA7IGogPCBhZGV2
LT5zZG1hLm51bV9pbnN0YW5jZXM7ICsraikKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmluZ3Nbal0gPSAmYWRldi0+c2RtYS5pbnN0YW5jZVtqXS5yaW5nOwo+Pj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbnVtX3JpbmdzID0gYWRldi0+c2RtYS5udW1faW5zdGFuY2VzOwo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2NoZWRfbGlzdCA9IGFkZXYtPnNkbWEuc2RtYV9z
Y2hlZF9saXN0Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnVtX3NjaGVkcyA9IGFkZXYt
PnNkbWEubnVtX2luc3RhbmNlczsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFr
Owo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgQU1ER1BVX0hXX0lQX1VWRDoKPj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJpbmdzWzBdID0gJmFkZXYtPnV2ZC5pbnN0WzBdLnJpbmc7Cj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBudW1fcmluZ3MgPSAxOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc2NoZWQgPSAmYWRldi0+dXZkLmluc3RbMF0ucmluZy5zY2hlZDsKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNjaGVkX2xpc3QgPSAmc2NoZWQ7Cj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBudW1fc2NoZWRzID0gMTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGJyZWFrOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgQU1ER1BVX0hXX0lQX1ZDRToK
Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJpbmdzWzBdID0gJmFkZXYtPnZjZS5yaW5nWzBd
Owo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnVtX3JpbmdzID0gMTsKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNjaGVkID0gJmFkZXYtPnZjZS5yaW5nWzBdLnNjaGVkOwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc2NoZWRfbGlzdCA9ICZzY2hlZDsKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG51bV9zY2hlZHMgPSAxOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYnJlYWs7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2FzZSBBTURHUFVfSFdfSVBfVVZEX0VO
QzoKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJpbmdzWzBdID0gJmFkZXYtPnV2ZC5pbnN0
WzBdLnJpbmdfZW5jWzBdOwo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnVtX3JpbmdzID0g
MTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNjaGVkID0gJmFkZXYtPnV2ZC5pbnN0WzBd
LnJpbmdfZW5jWzBdLnNjaGVkOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2NoZWRfbGlz
dCA9ICZzY2hlZDsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG51bV9zY2hlZHMgPSAxOwo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgY2FzZSBBTURHUFVfSFdfSVBfVkNOX0RFQzoKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGZvciAoaiA9IDA7IGogPCBhZGV2LT52Y24ubnVtX3Zjbl9pbnN0OyArK2opIHsKPj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGFkZXYtPnZjbi5oYXJ2ZXN0X2NvbmZpZyAm
ICgxIDw8IGopKQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bnRpbnVlOwo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByaW5nc1tudW1fcmlu
Z3MrK10gPSAmYWRldi0+dmNuLmluc3Rbal0ucmluZ19kZWM7Cj4+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB9Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzY2hlZF9saXN0ID0gYWRldi0+
dmNuLnZjbl9kZWNfc2NoZWRfbGlzdDsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG51bV9z
Y2hlZHMgPSBhZGV2LT52Y24ubnVtX3Zjbl9kZWNfc2NoZWRfbGlzdDsKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgQU1ER1BV
X0hXX0lQX1ZDTl9FTkM6Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGogPSAwOyBq
IDwgYWRldi0+dmNuLm51bV92Y25faW5zdDsgKytqKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChhZGV2LT52Y24uaGFydmVzdF9jb25maWcgJiAoMSA8PCBqKSkKPj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChrID0gMDsgayA8IGFkZXYtPnZjbi5u
dW1fZW5jX3JpbmdzOyArK2spCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmluZ3NbbnVtX3JpbmdzKytdID0gCj4+PiAmYWRldi0+dmNuLmluc3Rbal0ucmluZ19l
bmNba107Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzY2hlZF9saXN0ID0gYWRldi0+dmNuLnZjbl9lbmNfc2NoZWRfbGlzdDsKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG51bV9zY2hlZHMgPSBhZGV2LT52Y24ubnVtX3Zjbl9lbmNf
c2NoZWRfbGlzdDsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGNhc2UgQU1ER1BVX0hXX0lQX1ZDTl9KUEVHOgo+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZm9yIChqID0gMDsgaiA8IGFkZXYtPmpwZWcubnVtX2pwZWdfaW5zdDsg
KytqKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChhZGV2LT52Y24u
aGFydmVzdF9jb25maWcgJiAoMSA8PCBqKSkKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmluZ3NbbnVtX3JpbmdzKytdID0gJmFkZXYtPmpwZWcuaW5zdFtqXS5yaW5nX2RlYzsKPj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNj
aGVkX2xpc3QgPSBhZGV2LT5qcGVnLmpwZWdfc2NoZWRfbGlzdDsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIG51bV9zY2hlZHMgPcKgIGFkZXYtPmpwZWcubnVtX2pwZWdfc2NoZWRfbGlzdDsK
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIH0KPj4+IMKgIC3CoMKgwqDCoMKgwqDCoCBmb3IgKGogPSAwOyBqIDwgbnVtX3JpbmdzOyAr
K2opIHsKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghcmluZ3Nbal0tPmFkZXYpCj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4gLQo+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc2NoZWRfbGlzdFtudW1fcnFzKytdID0gJnJpbmdzW2pdLT5z
Y2hlZDsKPj4+IC3CoMKgwqDCoMKgwqDCoCB9Cj4+PiAtCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
Zm9yIChqID0gMDsgaiA8IGFtZGdwdV9jdHhfbnVtX2VudGl0aWVzW2ldOyArK2opCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByID0gZHJtX3NjaGVkX2VudGl0eV9pbml0KCZjdHgtPmVu
dGl0aWVzW2ldW2pdLmVudGl0eSwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcmlvcml0eSwgc2NoZWRfbGlzdCwKPj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBudW1fcnFzLCAmY3R4
LT5ndWlsdHkpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIG51bV9zY2hlZHMsICZjdHgtPmd1aWx0eSk7Cj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKHIpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycm9yX2NsZWFu
dXBfZW50aXRpZXM7Cj4+PiDCoMKgwqDCoMKgIH0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+Pj4gaW5kZXggY2Y0OTUzYzRlMmNmLi5mOTczYjYx
YTI2ZGEgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYwo+Pj4gQEAgLTI3MzgsNiArMjczOCw0OCBAQCBzdGF0aWMgaW50IAo+Pj4gYW1kZ3B1X2Rl
dmljZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
Cj4+PiDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+PiDCoCB9Cj4+PiDCoCArc3RhdGljIHZvaWQg
YW1kZ3B1X2RldmljZV9pbml0X3NjaGVkX2xpc3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgCj4+PiAq
YWRldikKPj4+ICt7Cj4+PiArwqDCoMKgIGludCBpLCBqOwo+Pj4gKwo+Pj4gK8KgwqDCoCBmb3Ig
KGkgPSAwOyBpIDwgYWRldi0+Z2Z4Lm51bV9nZnhfcmluZ3M7IGkrKykgewo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGFkZXYtPmdmeC5nZnhfc2NoZWRfbGlzdFtpXSA9ICZhZGV2LT5nZnguZ2Z4X3Jpbmdb
aV0uc2NoZWQ7Cj4+PiArwqDCoMKgwqDCoMKgwqAgYWRldi0+Z2Z4Lm51bV9nZnhfc2NoZWRfbGlz
dCsrOwo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBhZGV2
LT5nZngubnVtX2NvbXB1dGVfcmluZ3M7IGkrKykgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGFkZXYt
PmdmeC5jb21wdXRlX3NjaGVkX2xpc3RbaV0gPSAKPj4+ICZhZGV2LT5nZnguY29tcHV0ZV9yaW5n
W2ldLnNjaGVkOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGFkZXYtPmdmeC5udW1fY29tcHV0ZV9zY2hl
ZF9saXN0Kys7Cj4+PiArwqDCoMKgIH0KPj4+ICsKPj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8
IGFkZXYtPnNkbWEubnVtX2luc3RhbmNlczsgaSsrKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgYWRl
di0+c2RtYS5zZG1hX3NjaGVkX2xpc3RbaV0gPSAKPj4+ICZhZGV2LT5zZG1hLmluc3RhbmNlW2ld
LnJpbmcuc2NoZWQ7Cj4+PiArwqDCoMKgwqDCoMKgwqAgYWRldi0+c2RtYS5udW1fc2RtYV9zY2hl
ZF9saXN0Kys7Cj4+PiArwqDCoMKgIH0KPj4+ICsKPj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8
IGFkZXYtPnZjbi5udW1fdmNuX2luc3Q7ICsraSkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChh
ZGV2LT52Y24uaGFydmVzdF9jb25maWcgJiAoMSA8PCBpKSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNvbnRpbnVlOwo+Pj4gKyBhZGV2LT52Y24udmNuX2RlY19zY2hlZF9saXN0W2FkZXYt
PnZjbi5udW1fdmNuX2RlY19zY2hlZF9saXN0KytdID0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICZhZGV2LT52Y24uaW5zdFtpXS5yaW5nX2RlYy5zY2hlZDsKPj4+ICvCoMKgwqAgfQo+Pj4g
Kwo+Pj4gK8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwgYWRldi0+dmNuLm51bV92Y25faW5zdDsgKytp
KSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGFkZXYtPnZjbi5oYXJ2ZXN0X2NvbmZpZyAmICgx
IDw8IGkpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+PiArwqDCoMKg
wqDCoMKgwqAgZm9yIChqID0gMDsgaiA8IGFkZXYtPnZjbi5udW1fZW5jX3JpbmdzOyArK2opCj4+
PiArIGFkZXYtPnZjbi52Y25fZW5jX3NjaGVkX2xpc3RbYWRldi0+dmNuLm51bV92Y25fZW5jX3Nj
aGVkX2xpc3QrK10gPQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmYWRldi0+
dmNuLmluc3RbaV0ucmluZ19lbmNbal0uc2NoZWQ7Cj4+PiArwqDCoMKgIH0KPj4+ICsKPj4+ICvC
oMKgwqAgZm9yIChpID0gMDsgaSA8IGFkZXYtPmpwZWcubnVtX2pwZWdfaW5zdDsgKytpKSB7Cj4+
PiArwqDCoMKgwqDCoMKgwqAgaWYgKGFkZXYtPnZjbi5oYXJ2ZXN0X2NvbmZpZyAmICgxIDw8IGkp
KQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+PiArIGFkZXYtPmpwZWcu
anBlZ19zY2hlZF9saXN0W2FkZXYtPmpwZWcubnVtX2pwZWdfc2NoZWRfbGlzdCsrXSA9Cj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmYWRldi0+anBlZy5pbnN0W2ldLnJpbmdfZGVjLnNjaGVk
Owo+Pj4gK8KgwqDCoCB9Cj4+PiArfQo+Pj4gKwo+Pj4gwqAgLyoqCj4+PiDCoMKgICogYW1kZ3B1
X2RldmljZV9pbml0IC0gaW5pdGlhbGl6ZSB0aGUgZHJpdmVyCj4+PiDCoMKgICoKPj4+IEBAIC0z
MDI0LDYgKzMwNjYsOCBAQCBpbnQgYW1kZ3B1X2RldmljZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2
aWNlIAo+Pj4gKmFkZXYsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBmYWlsZWQ7Cj4+PiDC
oMKgwqDCoMKgIH0KPj4+IMKgICvCoMKgwqAgYW1kZ3B1X2RldmljZV9pbml0X3NjaGVkX2xpc3Qo
YWRldik7Cj4+PiArCj4+PiDCoMKgwqDCoMKgIGFkZXYtPmFjY2VsX3dvcmtpbmcgPSB0cnVlOwo+
Pj4gwqAgwqDCoMKgwqDCoCBhbWRncHVfdm1fY2hlY2tfY29tcHV0ZV9idWcoYWRldik7Cj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oIAo+Pj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKPj4+IGluZGV4IDBhZTBh
MjcxNWIwZC4uYjIyNjRkNGNkNTEwIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dmeC5oCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZ2Z4LmgKPj4+IEBAIC0yNjksOCArMjY5LDEyIEBAIHN0cnVjdCBhbWRncHVfZ2Z4
IHsKPj4+IMKgwqDCoMKgwqAgYm9vbMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZV9m
d193cml0ZV93YWl0Owo+Pj4gwqDCoMKgwqDCoCBib29swqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNwX2Z3X3dyaXRlX3dhaXQ7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfcmlu
ZyBnZnhfcmluZ1tBTURHUFVfTUFYX0dGWF9SSU5HU107Cj4+PiArwqDCoMKgIHN0cnVjdCBkcm1f
Z3B1X3NjaGVkdWxlciAqZ2Z4X3NjaGVkX2xpc3RbQU1ER1BVX01BWF9HRlhfUklOR1NdOwo+Pj4g
K8KgwqDCoCB1aW50MzJfdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnVtX2dmeF9zY2hlZF9saXN0
Owo+Pj4gwqDCoMKgwqDCoCB1bnNpZ25lZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnVtX2dmeF9y
aW5nczsKPj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9yaW5nIGNvbXB1dGVfcmluZ1tBTURH
UFVfTUFYX0NPTVBVVEVfUklOR1NdOwo+Pj4gK8KgwqDCoCB1aW50MzJfdMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbnVtX2NvbXB1dGVfc2NoZWRfbGlzdDsKPj4+ICvCoMKgwqAgc3RydWN0IGRybV9n
cHVfc2NoZWR1bGVyIAo+Pj4gKmNvbXB1dGVfc2NoZWRfbGlzdFtBTURHUFVfTUFYX0NPTVBVVEVf
UklOR1NdOwo+Pj4gwqDCoMKgwqDCoCB1bnNpZ25lZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnVt
X2NvbXB1dGVfcmluZ3M7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfaXJxX3NyY8KgwqDC
oMKgwqDCoMKgIGVvcF9pcnE7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfaXJxX3NyY8Kg
wqDCoMKgwqDCoMKgIHByaXZfcmVnX2lycTsKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfanBlZy5oIAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfanBlZy5oCj4+PiBpbmRleCA1MTMxYTBhMWJjOGEuLjVjZTZhYjA1ZWVhYyAx
MDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qcGVnLmgK
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qcGVnLmgKPj4+IEBA
IC00Myw2ICs0Myw4IEBAIHN0cnVjdCBhbWRncHVfanBlZyB7Cj4+PiDCoMKgwqDCoMKgIHVpbnQ4
X3TCoMKgwqAgbnVtX2pwZWdfaW5zdDsKPj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9qcGVn
X2luc3QgaW5zdFtBTURHUFVfTUFYX0pQRUdfSU5TVEFOQ0VTXTsKPj4+IMKgwqDCoMKgwqAgc3Ry
dWN0IGFtZGdwdV9qcGVnX3JlZyBpbnRlcm5hbDsKPj4+ICvCoMKgwqAgc3RydWN0IGRybV9ncHVf
c2NoZWR1bGVyIAo+Pj4gKmpwZWdfc2NoZWRfbGlzdFtBTURHUFVfTUFYX0pQRUdfSU5TVEFOQ0VT
XTsKPj4+ICvCoMKgwqAgdWludDMyX3QgbnVtX2pwZWdfc2NoZWRfbGlzdDsKPj4+IMKgwqDCoMKg
wqAgdW5zaWduZWQgaGFydmVzdF9jb25maWc7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBkZWxheWVk
X3dvcmsgaWRsZV93b3JrOwo+Pj4gwqDCoMKgwqDCoCBlbnVtIGFtZF9wb3dlcmdhdGluZ19zdGF0
ZSBjdXJfc3RhdGU7Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3NkbWEuaCAKPj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Nk
bWEuaAo+Pj4gaW5kZXggYjMxMzQ2NTU3ODlmLi4wZjZjYjY3NjgzOTggMTAwNjQ0Cj4+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2RtYS5oCj4+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2RtYS5oCj4+PiBAQCAtNTIsNiArNTIsOCBA
QCBzdHJ1Y3QgYW1kZ3B1X3NkbWFfaW5zdGFuY2Ugewo+Pj4gwqAgwqAgc3RydWN0IGFtZGdwdV9z
ZG1hIHsKPj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9zZG1hX2luc3RhbmNlIGluc3RhbmNl
W0FNREdQVV9NQVhfU0RNQV9JTlNUQU5DRVNdOwo+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX2dwdV9z
Y2hlZHVsZXIgCj4+PiAqc2RtYV9zY2hlZF9saXN0W0FNREdQVV9NQVhfU0RNQV9JTlNUQU5DRVNd
Owo+Pj4gK8KgwqDCoCB1aW50MzJfdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnVtX3NkbWFfc2No
ZWRfbGlzdDsKPj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9pcnFfc3JjwqDCoMKgIHRyYXBf
aXJxOwo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmPCoMKgwqAgaWxsZWdhbF9p
bnN0X2lycTsKPj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9pcnFfc3JjwqDCoMKgIGVjY19p
cnE7Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zj
bi5oIAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmgKPj4+IGlu
ZGV4IDQwMmE1MDQ2Yjk4NS4uYWU2NWNiOGYwN2U4IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdmNuLmgKPj4+IEBAIC0zMSw2ICszMSw3IEBACj4+PiDCoCAjZGVm
aW5lIEFNREdQVV9WQ05fTUFYX0VOQ19SSU5HU8KgwqDCoCAzCj4+PiDCoCDCoCAjZGVmaW5lIEFN
REdQVV9NQVhfVkNOX0lOU1RBTkNFU8KgwqDCoCAyCj4+PiArI2RlZmluZSBBTURHUFVfTUFYX1ZD
Tl9FTkNfUklOR1PCoCBBTURHUFVfVkNOX01BWF9FTkNfUklOR1MgKiAKPj4+IEFNREdQVV9NQVhf
VkNOX0lOU1RBTkNFUwo+Pj4gwqAgwqAgI2RlZmluZSBBTURHUFVfVkNOX0hBUlZFU1RfVkNOMCAo
MSA8PCAwKQo+Pj4gwqAgI2RlZmluZSBBTURHUFVfVkNOX0hBUlZFU1RfVkNOMSAoMSA8PCAxKQo+
Pj4gQEAgLTE4Niw4ICsxODcsMTIgQEAgc3RydWN0IGFtZGdwdV92Y24gewo+Pj4gwqDCoMKgwqDC
oCB1aW50MzJfdMKgwqDCoMKgwqDCoMKgICpkcGdfc3JhbV9jdXJyX2FkZHI7Cj4+PiDCoCDCoMKg
wqDCoMKgIHVpbnQ4X3TCoMKgwqAgbnVtX3Zjbl9pbnN0Owo+Pj4gLcKgwqDCoCBzdHJ1Y3QgYW1k
Z3B1X3Zjbl9pbnN0wqDCoMKgIGluc3RbQU1ER1BVX01BWF9WQ05fSU5TVEFOQ0VTXTsKPj4+IC3C
oMKgwqAgc3RydWN0IGFtZGdwdV92Y25fcmVnwqDCoMKgIGludGVybmFsOwo+Pj4gK8KgwqDCoCBz
dHJ1Y3QgYW1kZ3B1X3Zjbl9pbnN0IGluc3RbQU1ER1BVX01BWF9WQ05fSU5TVEFOQ0VTXTsKPj4+
ICvCoMKgwqAgc3RydWN0IGFtZGdwdV92Y25fcmVnwqDCoMKgwqAgaW50ZXJuYWw7Cj4+PiArwqDC
oMKgIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAKPj4+ICp2Y25fZW5jX3NjaGVkX2xpc3RbQU1E
R1BVX01BWF9WQ05fRU5DX1JJTkdTXTsKPj4+ICvCoMKgwqAgc3RydWN0IGRybV9ncHVfc2NoZWR1
bGVyIAo+Pj4gKnZjbl9kZWNfc2NoZWRfbGlzdFtBTURHUFVfTUFYX1ZDTl9JTlNUQU5DRVNdOwo+
Pj4gK8KgwqDCoCB1aW50MzJfdMKgwqDCoMKgwqDCoMKgwqAgbnVtX3Zjbl9lbmNfc2NoZWRfbGlz
dDsKPj4+ICvCoMKgwqAgdWludDMyX3TCoMKgwqDCoMKgwqDCoMKgIG51bV92Y25fZGVjX3NjaGVk
X2xpc3Q7Cj4+PiDCoCDCoMKgwqDCoMKgIHVuc2lnbmVkwqDCoMKgIGhhcnZlc3RfY29uZmlnOwo+
Pj4gwqDCoMKgwqDCoCBpbnQgKCpwYXVzZV9kcGdfbW9kZSkoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
