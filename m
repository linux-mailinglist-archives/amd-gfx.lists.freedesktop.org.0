Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC0C17F6B8
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Mar 2020 12:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85936E1D3;
	Tue, 10 Mar 2020 11:52:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310836E1D3
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Mar 2020 11:52:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4fQDoVcgbUDekOiwBXmpMNI3Bv7I52qRUj1vs0y2pC3dDsK/HI33Q70638l6ZdV3rdBwBCBFMQDkf7GcvPvu86DiTH1hQMhDbOxh2eOc9AzMa2dFbz7cw/S/T2StofeywXDCNSbXKj1k+WFyj40aXQnyfbC/Jhfo8LfMd4KrU8105LPtCvpQrK8OIejNOWNHdm6ToPy8a6s/GSP0qc9Nv+HcHbLvRXbU9bix5DEKC8dsJnDeWElL2u90VVN7Tple/C36XLEoEidGPJjw8ycbBEJNPVg2fSdtVR1/YuFpdzz6zy2maQBhqzA8tub0rNGZHn/VkGMrpin3rMKGvl8hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sC6N/IUwVFXvGKqjGPdIwOz7Ep6tmFUuCCQVj+trgTw=;
 b=izaEwdFwqoH/PtmGDM7j1+zMeYnSWMhtKeK9O1fO1RMXkyHdM+rNibniO050K049wMCyTw5NIQCZbne/V3aVoEoUA3KAcmpvZu88PgZlhRgvV9csUOtLSBdEQOta6XcOy3qV78SmKVjjou+5RNwkKNHxGQuNWaSZXdsPHd4IAlTd0G/2YlwC9jC6R9/xT8+Xzme+AaKR2UOKxXoPGhtaxUBSlamM4q9z6u0WDlx7k+RP3lguUHdi1EDjQu5tWV6A4TXNCUJdGYJqhsNcKgrxA49lU5ezfI40wZiTkBtw3y3zZdl0ECdApzh6ZCYfhJRgnGuxCeYPiYpED75m8XeTfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sC6N/IUwVFXvGKqjGPdIwOz7Ep6tmFUuCCQVj+trgTw=;
 b=oKxrNkZD54u192/hwKErHQh1zqY6oSOQmG+QQjE3VWedkyMeoAwjYrA6QVMCs8Ja4O93GXHEgROLG2KlQNVYH4C4z+GgSuvw/SbiIaKTBesiKUbbFzCmpOZC3DhS+3DbkYZRej7/tUcpJNEVKHJaL/9bARXLJqbwUTYySy/Bsso=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from MW2PR12MB2377.namprd12.prod.outlook.com (2603:10b6:907:11::20)
 by MW2PR12MB2443.namprd12.prod.outlook.com (2603:10b6:907:2::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Tue, 10 Mar
 2020 11:52:20 +0000
Received: from MW2PR12MB2377.namprd12.prod.outlook.com
 ([fe80::9855:f69e:d101:3b3f]) by MW2PR12MB2377.namprd12.prod.outlook.com
 ([fe80::9855:f69e:d101:3b3f%6]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 11:52:20 +0000
Subject: Re: [PATCH 1/2] drm/amdgpu: cleanup drm_gpu_scheduler array creation
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20200310112748.4899-1-nirmoy.das@amd.com>
 <ed446f25-2666-0926-8ed9-8d873ca9af7f@amd.com>
 <422d327e-58a5-8329-1260-c8daea5d501f@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <957a3df1-a04a-7375-3f42-c3bcec4493c4@amd.com>
Date: Tue, 10 Mar 2020 12:55:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <422d327e-58a5-8329-1260-c8daea5d501f@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0142.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::47) To MW2PR12MB2377.namprd12.prod.outlook.com
 (2603:10b6:907:11::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f32:a800:70e0:f409:f185:3dfd]
 (2003:c5:8f32:a800:70e0:f409:f185:3dfd) by
 AM0PR01CA0142.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16 via Frontend
 Transport; Tue, 10 Mar 2020 11:52:18 +0000
X-Originating-IP: [2003:c5:8f32:a800:70e0:f409:f185:3dfd]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cd523b9b-2227-4d5b-9729-08d7c4e97d2b
X-MS-TrafficTypeDiagnostic: MW2PR12MB2443:|MW2PR12MB2443:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2443B36D70390C4A1DD26A648BFF0@MW2PR12MB2443.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 033857D0BD
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(199004)(189003)(5660300002)(6486002)(31686004)(316002)(16526019)(110136005)(66476007)(66574012)(66556008)(2616005)(2906002)(8676002)(186003)(8936002)(478600001)(31696002)(66946007)(6666004)(4326008)(53546011)(81166006)(81156014)(36756003)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2443;
 H:MW2PR12MB2377.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KFp+3VgitTDEi96wsJ2RBQUOZAcF8wEsukZmIMpPhWiI4AT/1nPTQ/1GuUTyIq5WduWPFQfWohMTvaYgbx51wFfWwbP2LgJ+Hfjj13S8v38UsRmNpIHvyE56qlwzDz1iMQjGllKoh/S95PGES2bfg/v4ZGfXWDxPooFBXizH3ocdlvX6b8LZ/kcaSKjb4PvLUuJw1oaZH8c3SEyzalNt3raVRyjwcSiRV3Eambn+zKl9suUlPjbZ97vpoxPPq+skErNuo07PjFVFI9xoQUSrB/O4j1Y7s8kWyxL1IxlY4f7GgKFtMdHL7tGJYYO9z+YxVCDL2sfyJrWAcJGw/mQbE+l1sCvQS7/kA4vBzIrAmsDG6HA78Xj7pyOIRF/Qk5YO9BWNcnPLP/1yQlkQ1WEiYmpAY8qz5G1xiIoZc5A0pT6Q1wOqy9S9L2VPx6AHR/k7
X-MS-Exchange-AntiSpam-MessageData: Wy9VdVZ4l03m8p/TXBGFtc7eTJ/PlO2rGoR/QK7Pvs07gC9gpAfcwJw05LNLxP0AjfClb6md28XgKJ4w0mJM2GGVvZ+Zg9Qy/8XbiLwOIfm+eofVYV5BsMXSL5GWWQdj9cqsp24p9zs4v05A2igH7YwJ6hOYTMpWm9TVYnSEqdSNqReW+DznaOOU+56knoSQoz58adA+gIHGc+fMmYlXzA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd523b9b-2227-4d5b-9729-08d7c4e97d2b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2020 11:52:20.4556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPACanh4b3vOB25dcadMIwrRnWwt43LQ0IiDJAsVwqhbj4DhGq3BSTqDxPXCW9y4YehXH9Tyh2QtmCQzgftPEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2443
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
Cc: alexander.deucher@amd.com, Ray.Huang@amd.com, nirmoy.das@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDMvMTAvMjAgMTI6NDEgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gSGkgTmlybW95
LAo+Cj4geW91IGNhbiBzdGljayB3aXRoIHRoYXQgZm9yIG5vdy4KPgo+IEluIHRoZSBsb25nIHRl
cm0gd2Ugc2hvdWxkIG1ha2UgdGhlIHByaW9yaXR5IGEgcGFyYW1ldGVyIG9mIAo+IGFtZGdwdV9y
aW5nX2luaXQoKS4gQW5kIHRoZW4gYW1kZ3B1X3JpbmdfaW5pdCgpIGNhbiBnYXRoZXIgdGhlIHJp
bmdzIAo+IGJ5IHByaW9yaXR5IGFuZCB0eXBlLgo+Cj4gVGhhdCBpbiB0dXJuIHdvdWxkIG1ha2Ug
YW1kZ3B1X3JpbmdfaW5pdF9zY2hlZCgpIGFuZCAKPiBhbWRncHVfcmluZ19pbml0X2NvbXB1dGVf
c2NoZWQoKSBzdXBlcmZsdW91cy4KCgpZZXMgdGhhdCB3b3VsZCBiZSBldmVuIGJldHRlci4KCj4K
PiBCdXQgZml4aW5nIHRoZSBidWcgd2l0aCB0aGUgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIHNo
b3VsZCBjb21lIAo+IGZpcnN0LCBldmVyeXRoaW5nIGVsc2UgaXMganVzdCBjbGVhbnVwIGFuZCBo
YXMgbG93ZXIgdXJnZW5jeS4KCgpJIHdpbGwgc3dhcCB0aGVzZSB0d28gcGF0Y2hlcy4KCgpUaGFu
a3MsCgpOaXJtb3kKCj4KPiBSZWdhcmRzLAo+IENocmlzdGlhbi4KPgo+IEFtIDEwLjAzLjIwIHVt
IDEyOjM5IHNjaHJpZWIgTmlybW95Ogo+PiBIaSBDaHJpc3RpYW4sCj4+Cj4+Cj4+IEkgdGhpbmsg
d2Ugc3RpbGwgbmVlZCBhbWRncHVfcmluZy5oYXNfaGlnaF9wcmlvIGJvb2wuIEkgd2FzIHRoaW5r
aW5nIAo+PiBvZiB1c2luZwo+Pgo+PiBhbWRncHVfZ2Z4X2lzX2hpZ2hfcHJpb3JpdHlfY29tcHV0
ZV9xdWV1ZSgpIHRvIHNlZSBpZiBhIHJpbmcgaXMgc2V0IAo+PiB0byBoaWdoIHByaW9yaXR5Cj4+
Cj4+IGJ1dCB0aGVuIEkgcmVhbGl6ZWQgd2UgZG9uJ3Qgc3VwcG9ydCBoaWdoIHByaW9yaXR5IGdm
eCBxdWV1ZSBvbiBnZng3IAo+PiBhbmQgbGVzcy4KPj4KPj4KPj4gUmVnYXJkcywKPj4KPj4gTmly
bW95Cj4+Cj4+IE9uIDMvMTAvMjAgMTI6MjcgUE0sIE5pcm1veSBEYXMgd3JvdGU6Cj4+PiBNb3Zl
IGluaXRpYWxpemF0aW9uIG9mIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciBhcnJheSwKPj4+IGFt
ZGdwdV9jdHhfaW5pdF9zY2hlZCgpIHRvIGFtZGdwdV9yaW5nLmMuCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgo+Pj4gLS0tCj4+PiDCoCBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmPCoMKgwqAgfCA2OCAtLS0tLS0tLS0t
LS0tLS0tLS0tCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmjC
oMKgwqAgfMKgIDMgLQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jIHzCoCAyICstCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmluZy5jwqDCoCB8IDc3IAo+Pj4gKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gwqAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaMKgwqAgfMKgIDIgKwo+Pj4gwqAgNSBm
aWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspLCA3MiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jIAo+Pj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKPj4+IGluZGV4IDNiMjM3
MGFkMWU0Ny4uMDZkMTUxYzBmZTRlIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2N0eC5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfY3R4LmMKPj4+IEBAIC02NjEsNzEgKzY2MSwzIEBAIHZvaWQgYW1kZ3B1X2N0eF9t
Z3JfZmluaShzdHJ1Y3QgYW1kZ3B1X2N0eF9tZ3IgCj4+PiAqbWdyKQo+Pj4gwqDCoMKgwqDCoCBp
ZHJfZGVzdHJveSgmbWdyLT5jdHhfaGFuZGxlcyk7Cj4+PiDCoMKgwqDCoMKgIG11dGV4X2Rlc3Ry
b3koJm1nci0+bG9jayk7Cj4+PiDCoCB9Cj4+PiAtCj4+PiAtCj4+PiAtc3RhdGljIHZvaWQgYW1k
Z3B1X2N0eF9pbml0X2NvbXB1dGVfc2NoZWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+
PiAtewo+Pj4gLcKgwqDCoCBpbnQgbnVtX2NvbXB1dGVfc2NoZWRfbm9ybWFsID0gMDsKPj4+IC3C
oMKgwqAgaW50IG51bV9jb21wdXRlX3NjaGVkX2hpZ2ggPSBBTURHUFVfTUFYX0NPTVBVVEVfUklO
R1MgLSAxOwo+Pj4gLcKgwqDCoCBpbnQgaTsKPj4+IC0KPj4+IC3CoMKgwqAgLyogdXNlIG9uZSBk
cm0gc2NoZWQgYXJyYXksIGdmeC5jb21wdXRlX3NjaGVkIHRvIHN0b3JlIGJvdGggCj4+PiBoaWdo
IGFuZAo+Pj4gLcKgwqDCoMKgICogbm9ybWFsIHByaW9yaXR5IGRybSBjb21wdXRlIHNjaGVkdWxl
cnMgKi8KPj4+IC3CoMKgwqAgZm9yIChpID0gMDsgaSA8IGFkZXYtPmdmeC5udW1fY29tcHV0ZV9y
aW5nczsgaSsrKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCFhZGV2LT5nZnguY29tcHV0ZV9y
aW5nW2ldLmhhc19oaWdoX3ByaW8pCj4+PiAtIGFkZXYtPmdmeC5jb21wdXRlX3NjaGVkW251bV9j
b21wdXRlX3NjaGVkX25vcm1hbCsrXSA9Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICZhZGV2LT5nZnguY29tcHV0ZV9yaW5nW2ldLnNjaGVkOwo+Pj4gLcKgwqDCoMKgwqDCoMKg
IGVsc2UKPj4+IC0gYWRldi0+Z2Z4LmNvbXB1dGVfc2NoZWRbbnVtX2NvbXB1dGVfc2NoZWRfaGln
aC0tXSA9Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZhZGV2LT5nZnguY29t
cHV0ZV9yaW5nW2ldLnNjaGVkOwo+Pj4gLcKgwqDCoCB9Cj4+PiAtCj4+PiAtwqDCoMKgIC8qIGNv
bXB1dGUgcmluZyBvbmx5IGhhcyB0d28gcHJpb3JpdHkgZm9yIG5vdyAqLwo+Pj4gLcKgwqDCoCBp
ID0gQU1ER1BVX0dGWF9QSVBFX1BSSU9fTk9STUFMOwo+Pj4gLcKgwqDCoCBhZGV2LT5nZnguY29t
cHV0ZV9wcmlvX3NjaGVkW2ldID0gJmFkZXYtPmdmeC5jb21wdXRlX3NjaGVkWzBdOwo+Pj4gLcKg
wqDCoCBhZGV2LT5nZngubnVtX2NvbXB1dGVfc2NoZWRbaV0gPSBudW1fY29tcHV0ZV9zY2hlZF9u
b3JtYWw7Cj4+PiAtCj4+PiAtwqDCoMKgIGkgPSBBTURHUFVfR0ZYX1BJUEVfUFJJT19ISUdIOwo+
Pj4gLcKgwqDCoCBhZGV2LT5nZnguY29tcHV0ZV9wcmlvX3NjaGVkW2ldID0KPj4+IC0gJmFkZXYt
PmdmeC5jb21wdXRlX3NjaGVkW251bV9jb21wdXRlX3NjaGVkX2hpZ2ggLSAxXTsKPj4+IC3CoMKg
wqAgYWRldi0+Z2Z4Lm51bV9jb21wdXRlX3NjaGVkW2ldID0KPj4+IC3CoMKgwqDCoMKgwqDCoCBh
ZGV2LT5nZngubnVtX2NvbXB1dGVfcmluZ3MgLSBudW1fY29tcHV0ZV9zY2hlZF9ub3JtYWw7Cj4+
PiAtfQo+Pj4gLQo+Pj4gLXZvaWQgYW1kZ3B1X2N0eF9pbml0X3NjaGVkKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQo+Pj4gLXsKPj4+IC3CoMKgwqAgaW50IGksIGo7Cj4+PiAtCj4+PiAtwqDC
oMKgIGFtZGdwdV9jdHhfaW5pdF9jb21wdXRlX3NjaGVkKGFkZXYpOwo+Pj4gLcKgwqDCoCBmb3Ig
KGkgPSAwOyBpIDwgYWRldi0+Z2Z4Lm51bV9nZnhfcmluZ3M7IGkrKykgewo+Pj4gLcKgwqDCoMKg
wqDCoMKgIGFkZXYtPmdmeC5nZnhfc2NoZWRbaV0gPSAmYWRldi0+Z2Z4LmdmeF9yaW5nW2ldLnNj
aGVkOwo+Pj4gLcKgwqDCoMKgwqDCoMKgIGFkZXYtPmdmeC5udW1fZ2Z4X3NjaGVkKys7Cj4+PiAt
wqDCoMKgIH0KPj4+IC0KPj4+IC3CoMKgwqAgZm9yIChpID0gMDsgaSA8IGFkZXYtPnNkbWEubnVt
X2luc3RhbmNlczsgaSsrKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgYWRldi0+c2RtYS5zZG1hX3Nj
aGVkW2ldID0gJmFkZXYtPnNkbWEuaW5zdGFuY2VbaV0ucmluZy5zY2hlZDsKPj4+IC3CoMKgwqDC
oMKgwqDCoCBhZGV2LT5zZG1hLm51bV9zZG1hX3NjaGVkKys7Cj4+PiAtwqDCoMKgIH0KPj4+IC0K
Pj4+IC3CoMKgwqAgZm9yIChpID0gMDsgaSA8IGFkZXYtPnZjbi5udW1fdmNuX2luc3Q7ICsraSkg
ewo+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChhZGV2LT52Y24uaGFydmVzdF9jb25maWcgJiAoMSA8
PCBpKSkKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4gLSBhZGV2LT52
Y24udmNuX2RlY19zY2hlZFthZGV2LT52Y24ubnVtX3Zjbl9kZWNfc2NoZWQrK10gPQo+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgJmFkZXYtPnZjbi5pbnN0W2ldLnJpbmdfZGVjLnNjaGVkOwo+
Pj4gLcKgwqDCoCB9Cj4+PiAtCj4+PiAtwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBhZGV2LT52Y24u
bnVtX3Zjbl9pbnN0OyArK2kpIHsKPj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoYWRldi0+dmNuLmhh
cnZlc3RfY29uZmlnICYgKDEgPDwgaSkpCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250
aW51ZTsKPj4+IC3CoMKgwqDCoMKgwqDCoCBmb3IgKGogPSAwOyBqIDwgYWRldi0+dmNuLm51bV9l
bmNfcmluZ3M7ICsraikKPj4+IC0gYWRldi0+dmNuLnZjbl9lbmNfc2NoZWRbYWRldi0+dmNuLm51
bV92Y25fZW5jX3NjaGVkKytdID0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
JmFkZXYtPnZjbi5pbnN0W2ldLnJpbmdfZW5jW2pdLnNjaGVkOwo+Pj4gLcKgwqDCoCB9Cj4+PiAt
Cj4+PiAtwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBhZGV2LT5qcGVnLm51bV9qcGVnX2luc3Q7ICsr
aSkgewo+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChhZGV2LT5qcGVnLmhhcnZlc3RfY29uZmlnICYg
KDEgPDwgaSkpCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+IC0gYWRl
di0+anBlZy5qcGVnX3NjaGVkW2FkZXYtPmpwZWcubnVtX2pwZWdfc2NoZWQrK10gPQo+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgJmFkZXYtPmpwZWcuaW5zdFtpXS5yaW5nX2RlYy5zY2hlZDsK
Pj4+IC3CoMKgwqAgfQo+Pj4gLX0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfY3R4LmggCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jdHguaAo+Pj4gaW5kZXggZGU0OTBmMTgzYWYyLi5mNTRlMTAzMTQ2NjEgMTAwNjQ0Cj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmgKPj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguaAo+Pj4gQEAgLTg4LDcgKzg4
LDQgQEAgdm9pZCBhbWRncHVfY3R4X21ncl9lbnRpdHlfZmluaShzdHJ1Y3QgCj4+PiBhbWRncHVf
Y3R4X21nciAqbWdyKTsKPj4+IMKgIGxvbmcgYW1kZ3B1X2N0eF9tZ3JfZW50aXR5X2ZsdXNoKHN0
cnVjdCBhbWRncHVfY3R4X21nciAqbWdyLCBsb25nIAo+Pj4gdGltZW91dCk7Cj4+PiDCoCB2b2lk
IGFtZGdwdV9jdHhfbWdyX2Zpbmkoc3RydWN0IGFtZGdwdV9jdHhfbWdyICptZ3IpOwo+Pj4gwqAg
LXZvaWQgYW1kZ3B1X2N0eF9pbml0X3NjaGVkKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsK
Pj4+IC0KPj4+IC0KPj4+IMKgICNlbmRpZgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyAKPj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jCj4+PiBpbmRleCA1NzJlYjZlYThlYWIuLmIyYTk5ZjlmYzIy
MyAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
Cj4+PiBAQCAtMzA5Miw3ICszMDkyLDcgQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAKPj4+ICphZGV2LAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YWRldi0+Z2Z4LmNvbmZpZy5tYXhfY3VfcGVyX3NoLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYWRldi0+Z2Z4LmN1X2luZm8ubnVtYmVyKTsKPj4+IMKgIC3CoMKgwqAgYW1kZ3B1X2N0
eF9pbml0X3NjaGVkKGFkZXYpOwo+Pj4gK8KgwqDCoCBhbWRncHVfcmluZ19pbml0X3NjaGVkKGFk
ZXYpOwo+Pj4gwqAgwqDCoMKgwqDCoCBhZGV2LT5hY2NlbF93b3JraW5nID0gdHJ1ZTsKPj4+IMKg
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5jIAo+
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5jCj4+PiBpbmRleCBh
N2UxZDA0MjVlZDAuLjk5ODc1ZGQ2MzNlNiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yaW5nLmMKPj4+IEBAIC00NTQsMyArNDU0LDgwIEBAIGludCBhbWRncHVf
cmluZ190ZXN0X2hlbHBlcihzdHJ1Y3QgYW1kZ3B1X3JpbmcgCj4+PiAqcmluZykKPj4+IMKgwqDC
oMKgwqAgcmluZy0+c2NoZWQucmVhZHkgPSAhcjsKPj4+IMKgwqDCoMKgwqAgcmV0dXJuIHI7Cj4+
PiDCoCB9Cj4+PiArCj4+PiArc3RhdGljIHZvaWQgYW1kZ3B1X3JpbmdfaW5pdF9jb21wdXRlX3Nj
aGVkKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+Pj4gK3sKPj4+ICvCoMKgwqAgaW50IG51
bV9jb21wdXRlX3NjaGVkX25vcm1hbCA9IDA7Cj4+PiArwqDCoMKgIGludCBudW1fY29tcHV0ZV9z
Y2hlZF9oaWdoID0gQU1ER1BVX01BWF9DT01QVVRFX1JJTkdTIC0gMTsKPj4+ICvCoMKgwqAgaW50
IGk7Cj4+PiArCj4+PiArwqDCoMKgIC8qIHVzZSBvbmUgZHJtIHNjaGVkIGFycmF5LCBnZnguY29t
cHV0ZV9zY2hlZCB0byBzdG9yZSBib3RoIAo+Pj4gaGlnaCBhbmQgKi8KPj4+ICvCoMKgwqAgLyog
bm9ybWFsIHByaW9yaXR5IGRybSBjb21wdXRlIHNjaGVkdWxlcnMgKi8KPj4+ICvCoMKgwqAgZm9y
IChpID0gMDsgaSA8IGFkZXYtPmdmeC5udW1fY29tcHV0ZV9yaW5nczsgaSsrKSB7Cj4+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKCFhZGV2LT5nZnguY29tcHV0ZV9yaW5nW2ldLmhhc19oaWdoX3ByaW8p
Cj4+PiArIGFkZXYtPmdmeC5jb21wdXRlX3NjaGVkW251bV9jb21wdXRlX3NjaGVkX25vcm1hbCsr
XSA9Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZhZGV2LT5nZnguY29tcHV0
ZV9yaW5nW2ldLnNjaGVkOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGVsc2UKPj4+ICsgYWRldi0+Z2Z4
LmNvbXB1dGVfc2NoZWRbbnVtX2NvbXB1dGVfc2NoZWRfaGlnaC0tXSA9Cj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICZhZGV2LT5nZnguY29tcHV0ZV9yaW5nW2ldLnNjaGVkOwo+
Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiArwqDCoMKgIC8qIGNvbXB1dGUgcmluZyBvbmx5IGhhcyB0
d28gcHJpb3JpdHkgZm9yIG5vdyAqLwo+Pj4gK8KgwqDCoCBpID0gQU1ER1BVX0dGWF9QSVBFX1BS
SU9fTk9STUFMOwo+Pj4gK8KgwqDCoCBhZGV2LT5nZnguY29tcHV0ZV9wcmlvX3NjaGVkW2ldID0g
JmFkZXYtPmdmeC5jb21wdXRlX3NjaGVkWzBdOwo+Pj4gK8KgwqDCoCBhZGV2LT5nZngubnVtX2Nv
bXB1dGVfc2NoZWRbaV0gPSBudW1fY29tcHV0ZV9zY2hlZF9ub3JtYWw7Cj4+PiArCj4+PiArwqDC
oMKgIGkgPSBBTURHUFVfR0ZYX1BJUEVfUFJJT19ISUdIOwo+Pj4gK8KgwqDCoCBhZGV2LT5nZngu
Y29tcHV0ZV9wcmlvX3NjaGVkW2ldID0KPj4+ICsgJmFkZXYtPmdmeC5jb21wdXRlX3NjaGVkW251
bV9jb21wdXRlX3NjaGVkX2hpZ2ggLSAxXTsKPj4+ICvCoMKgwqAgYWRldi0+Z2Z4Lm51bV9jb21w
dXRlX3NjaGVkW2ldID0KPj4+ICvCoMKgwqDCoMKgwqDCoCBhZGV2LT5nZngubnVtX2NvbXB1dGVf
cmluZ3MgLSBudW1fY29tcHV0ZV9zY2hlZF9ub3JtYWw7Cj4+PiArfQo+Pj4gKwo+Pj4gKy8qKgo+
Pj4gKyAqIGFtZGdwdV9yaW5nX2luaXRfc2NoZWQgLSBwb3B1bGF0ZSBhcnJheSBvZiBkcm0gc2No
ZWRzIGZvciBlYWNoIAo+Pj4gSFcgSVAKPj4+ICsgKgo+Pj4gKyAqIEBhZGV2OiBhbWRncHVfZGV2
aWNlIHBvaW50ZXIKPj4+ICsgKgo+Pj4gKyAqIFBvcHVsYXRlIGFuIGFycmF5IG9mIHN0cnVjdCBk
cm1fZ3B1X3NjaGVkdWxlcnMgZm9yIGVhY2ggSFcgSVAgd2hpY2gKPj4+ICsgKiBjYW4gYmUgdXNl
IGJ5IGFtZGdwdV9jdHhfZ2V0X2VudGl0eSgpIHRvIGluaXRpYWxpemUgYW4gZW50aXR5Lgo+Pj4g
KyAqCj4+PiArICovCj4+PiArCj4+PiArdm9pZCBhbWRncHVfcmluZ19pbml0X3NjaGVkKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQo+Pj4gK3sKPj4+ICvCoMKgwqAgaW50IGksIGo7Cj4+PiAr
Cj4+PiArwqDCoMKgIGFtZGdwdV9yaW5nX2luaXRfY29tcHV0ZV9zY2hlZChhZGV2KTsKPj4+ICvC
oMKgwqAgZm9yIChpID0gMDsgaSA8IGFkZXYtPmdmeC5udW1fZ2Z4X3JpbmdzOyBpKyspIHsKPj4+
ICvCoMKgwqDCoMKgwqDCoCBhZGV2LT5nZnguZ2Z4X3NjaGVkW2ldID0gJmFkZXYtPmdmeC5nZnhf
cmluZ1tpXS5zY2hlZDsKPj4+ICvCoMKgwqDCoMKgwqDCoCBhZGV2LT5nZngubnVtX2dmeF9zY2hl
ZCsrOwo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBhZGV2
LT5zZG1hLm51bV9pbnN0YW5jZXM7IGkrKykgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGFkZXYtPnNk
bWEuc2RtYV9zY2hlZFtpXSA9ICZhZGV2LT5zZG1hLmluc3RhbmNlW2ldLnJpbmcuc2NoZWQ7Cj4+
PiArwqDCoMKgwqDCoMKgwqAgYWRldi0+c2RtYS5udW1fc2RtYV9zY2hlZCsrOwo+Pj4gK8KgwqDC
oCB9Cj4+PiArCj4+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBhZGV2LT52Y24ubnVtX3Zjbl9p
bnN0OyArK2kpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoYWRldi0+dmNuLmhhcnZlc3RfY29u
ZmlnICYgKDEgPDwgaSkpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+
ICsgYWRldi0+dmNuLnZjbl9kZWNfc2NoZWRbYWRldi0+dmNuLm51bV92Y25fZGVjX3NjaGVkKytd
ID0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZhZGV2LT52Y24uaW5zdFtpXS5yaW5nX2Rl
Yy5zY2hlZDsKPj4+ICvCoMKgwqAgfQo+Pj4gKwo+Pj4gK8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwg
YWRldi0+dmNuLm51bV92Y25faW5zdDsgKytpKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGFk
ZXYtPnZjbi5oYXJ2ZXN0X2NvbmZpZyAmICgxIDw8IGkpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY29udGludWU7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZm9yIChqID0gMDsgaiA8IGFkZXYt
PnZjbi5udW1fZW5jX3JpbmdzOyArK2opCj4+PiArIGFkZXYtPnZjbi52Y25fZW5jX3NjaGVkW2Fk
ZXYtPnZjbi5udW1fdmNuX2VuY19zY2hlZCsrXSA9Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICZhZGV2LT52Y24uaW5zdFtpXS5yaW5nX2VuY1tqXS5zY2hlZDsKPj4+ICvCoMKg
wqAgfQo+Pj4gKwo+Pj4gK8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwgYWRldi0+anBlZy5udW1fanBl
Z19pbnN0OyArK2kpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoYWRldi0+anBlZy5oYXJ2ZXN0
X2NvbmZpZyAmICgxIDw8IGkpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7
Cj4+PiArIGFkZXYtPmpwZWcuanBlZ19zY2hlZFthZGV2LT5qcGVnLm51bV9qcGVnX3NjaGVkKytd
ID0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZhZGV2LT5qcGVnLmluc3RbaV0ucmluZ19k
ZWMuc2NoZWQ7Cj4+PiArwqDCoMKgIH0KPj4+ICt9Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaCAKPj4+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3JpbmcuaAo+Pj4gaW5kZXggOWE0NDMwMTNkNzBkLi40Y2NkMDU2ZDQz
NTMgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmlu
Zy5oCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oCj4+
PiBAQCAtMzI2LDQgKzMyNiw2IEBAIGludCBhbWRncHVfZGVidWdmc19yaW5nX2luaXQoc3RydWN0
IAo+Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpOwo+Pj4gwqAgdm9pZCBhbWRncHVf
ZGVidWdmc19yaW5nX2Zpbmkoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKTsKPj4+IMKgICt2b2lk
IGFtZGdwdV9yaW5nX2luaXRfc2NoZWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwo+Pj4g
Kwo+Pj4gwqAgI2VuZGlmCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
Cg==
