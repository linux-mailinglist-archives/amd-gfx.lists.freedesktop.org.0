Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A0E26FC55
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Sep 2020 14:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06D06E160;
	Fri, 18 Sep 2020 12:17:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BA36E150
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Sep 2020 12:17:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kk79zXuH+J0+DolahoDLdrkL1PBXzcIu7G5Up26Ib+0ahbXPU6/oHV0wHhhcJkXlp0kCJwlkRF6StO7X4DA/P61IZhc0PSeiDWV7QLmbk6hMCnE7DvzFn+PRZFH828ybQMZHMNjzCnxDSU9/Syy18hs1HW5gIidLzrEIJ8PBOpi+vMXD984X0sGk50V0S4177yl4WFWuUPlqhs88lMGubKF0tR8wVasBxgnTtNGjAlYk4yTbhtBLW+o/9FvJlqF4or6Hgm27BpdiRXg8PVOxBvtVucYRTRQitN2kDoQ173nQv50HBs621mYV2ymWg0yEDvLW+QKjFbklf8aExdh04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HX4+jjpIWDBL1sw1XQR7LS7lDE8BkDQsE7zEv4lupY0=;
 b=mv4zHxXdmAJTKIXnh51xHUU9k1MM4813uj2jHNi3nK9rLg0Z5RNboZyd0FzWCnBKp0jCb9cmfvZ5i1aUowgwzIUbSMwMJY/Rk5Z0pYt1ryLOhxOuBSRdakG8nJxmDpfEwxP9nUBgIDqWbsO+HJIlJ4qsNiJ/wwNBtQI0IWo6JNHvZdK72E+Nf6GfAEmQRj828awrw546dkxbmlcMdfHaxt46Adh9bPuXrZxo0aZrXUMQvlwMbD7Rf1yZvFaths4tsmBvYIVqAGIrjzY6WSfloRMsOUbRgV9tsSf+x6ySpEcyWKwpdm40RG1+cpH35NEBn+yMPutlN5vRoc/+ov3i4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HX4+jjpIWDBL1sw1XQR7LS7lDE8BkDQsE7zEv4lupY0=;
 b=yCM6927473aVmzwUyH569CyarsdPtmW87n92U9gD6SnGrFMl/3a1TfOUSKg7OUDaQA1h10BOptRADQHSyB9eawrYpT88n2RgGj7YHx4GU3KTYxgEH+fRhsNYiCC4Ax527FSTa0/5HW5ucS89jnYCi9AwEIMH6skJviIaXfUIPOc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4301.namprd12.prod.outlook.com (2603:10b6:208:1d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 18 Sep
 2020 12:17:35 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Fri, 18 Sep 2020
 12:17:35 +0000
Subject: Re: [PATCH 3/3] drm/amdgpu: support indirect access reg outside of
 mmio bar (v2)
To: "Russell, Kent" <Kent.Russell@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "Chen, Guchun"
 <Guchun.Chen@amd.com>
References: <1600422710-27228-1-git-send-email-Hawking.Zhang@amd.com>
 <1600422710-27228-3-git-send-email-Hawking.Zhang@amd.com>
 <5117d8d3-833f-82a0-92cd-407e7d154750@gmail.com>
 <DM6PR12MB4075248B90169CDD544568F3FC3F0@DM6PR12MB4075.namprd12.prod.outlook.com>
 <DM6PR12MB3721860C2A9431F1663B30BC853F0@DM6PR12MB3721.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e3326bb0-519c-c279-17fe-02b67120d55b@amd.com>
Date: Fri, 18 Sep 2020 14:17:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <DM6PR12MB3721860C2A9431F1663B30BC853F0@DM6PR12MB3721.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR08CA0019.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR08CA0019.eurprd08.prod.outlook.com (2603:10a6:208:d2::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Fri, 18 Sep 2020 12:17:33 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2c58809a-c254-42db-0876-08d85bccd324
X-MS-TrafficTypeDiagnostic: MN2PR12MB4301:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43011BC9E7DCE9D422A6125C833F0@MN2PR12MB4301.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lXUHcM6Yvdh37l4sSnyJNfY7g7IQtVsqbSTpfKw838RYIJ8GcOlWQhRLNQLp8FXVNs61ew+nMIauJkZ4y9cexNsQHl89JY7OHLYH0iWc9Pl+RspHuuuUSeTZOHIA5eyEuxNqWdKXCEcrQFC0891e3+sVJ/OhhaFOj4QemQYei8+fkQYDLzpFR/13k5bDVf2ClItfNxIvyLIH6MfPF69hBDHirtYTDpx35Tlq6JxOQN4NKp8ru+imWF3+KSfyoOJ37SgCkAm/Vp8Ep0EaUF21hfsxXI1BpRhTZouYuV1vLErGKiEaz9bT3f7KK32fQY1cWRSG88ZPOt5LQZXtn4xYAvfj/Uh7mL8viIoc5kOt96xbpk6JpYI1QHq2tyEbb+5aDrbMOK1BG6dXrhUJuXVzHe9CDhHeN9IRrmWk0VIG0pptQy94k8YvWUNZ4kehcz7nPsFqm4wQvGMx7rUkRhKpGEsjV6SWB7+y+ndG7AJPmd8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(52116002)(66556008)(66476007)(5660300002)(316002)(2616005)(110136005)(6636002)(31696002)(66946007)(53546011)(86362001)(31686004)(6486002)(6666004)(30864003)(16526019)(36756003)(966005)(478600001)(2906002)(66574015)(8676002)(8936002)(83380400001)(45080400002)(186003)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 797wEIUpGp5ebfTqnZtku9+/dggYcbc8R/8tXgZtEBgprQaBGndJJ74l65kCUU/O25VfihixYgh1EWE7SzfXjr9YBTj1CnnQHKSsUk3tiV3sGyBhz/fsOX8E1bMShVZLWYdt7L0HVCXlOvxdjh6vEvodWRDkCCohesU0rzpaIMXr8Em4BtvnpdgP5qRwDGbQt2ck5oEh9CH2R/JiH6fFfjheBojwwMOA5chJZxZvWvaE71VndCSXRQ96PbYvB3jAoAQMMByQx9mzpm43Jd0yYz9eJZ56pGPrhJTvion7APxGbZYrvCmDKQ9rf63vm2rWatUTjdKG1xVvSWez5pD/xLAe5ezLnL+dUXz4M/t5a9pxR2FpKOBFuDLSlyQDO8LK4FVxF+erXqh34JZaMjfyKuN6LpbNbMjfjA1aGHxbUGodG8FxMHp5LJUaI+MGiUGJS3MxKMChXZpuc2yINdz8x4GAI82+gd5HjTFEIvWc3KlqodDuA/xbkansy+ZaeQoVim9B6ZP1BpPLDAeQ615+Xjkj2cYftr1+DDrPyLCiev6zh+bW9nuIgSjTiOVw0aSk9Oo4v+ixWotLVd31LXsjtqE3le5cYWBwmxO56UwmlcqKeHI838FdbvWzbAR+O8rxhdfZCP+qMJOu6uVInNysl+IGuM4es3FBSdxzBEX1+8YEhtxX8U77Fpv6tmV2j8MUVl3BbSqht7xakTCuodlo4g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c58809a-c254-42db-0876-08d85bccd324
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 12:17:35.0283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/t6vdtNCA1rUVrA+rSNDvQXF/EurCvClmfIN3096cry+7X8KuM5PIRB9v4JUlXx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4301
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

VG8gYmUgbW9yZSBwcmVjaXNlIHlvdSBjYW4gZWl0aGVyIHVzZSAiZWxzZSIgb3IgIn0gZWxzZSB7
IiwgYnV0IGRvbid0IAp1c2UgIn0gZWxzZSIgb3IgImVsc2UgeyIuCgpJbnRlcmVzdGluZyB0aGF0
IGNoZWNrcGF0Y2gucGwgZG9lc24ndCBjb21wbGFpbiwgSSB0aG91Z2h0IHRoYXQgdGhpcyAKd291
bGQgYmUgY2hlY2tlZC4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCkFtIDE4LjA5LjIwIHVtIDE0OjEy
IHNjaHJpZWIgUnVzc2VsbCwgS2VudDoKPiBbQU1EIFB1YmxpYyBVc2VdCj4KPiBJdCdzIHByZWZl
cnJlZCB0byBoYXZlIGJyYWNlcyBpZiB0aGUgZWxzZSBoYXMgYSBzaW5nbGUgbGluZToKPiBodHRw
czovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y0LjEwL3Byb2Nlc3MvY29kaW5nLXN0eWxlLmh0
bWwjcGxhY2luZy1icmFjZXMtYW5kLXNwYWNlcwo+IFJpZ2h0IGFib3ZlICIzLjEpIFNwYWNlcyIK
Pgo+ICAgS2VudAo+Cj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IGFtZC1n
ZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBa
aGFuZywgSGF3a2luZwo+PiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciAxOCwgMjAyMCA4OjA3IEFN
Cj4+IFRvOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7Cj4+IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFu
ZGVyLkRldWNoZXJAYW1kLmNvbT47IFdhbmcsIEtldmluKFlhbmcpCj4+IDxLZXZpbjEuV2FuZ0Bh
bWQuY29tPjsgQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPgo+PiBTdWJqZWN0OiBS
RTogW1BBVENIIDMvM10gZHJtL2FtZGdwdTogc3VwcG9ydCBpbmRpcmVjdCBhY2Nlc3MgcmVnIG91
dHNpZGUgb2YgbW1pbyBiYXIgKHYyKQo+Pgo+PiBbQU1EIFB1YmxpYyBVc2VdCj4+Cj4+PiArCX0g
ZWxzZQo+PiBSRSAtIFRoaXMgc2hvdWxkIHVzZSAifSBlbHNlIHsiLiBBcGFydCBmcm9tIHRoYXQg
bG9va3MgZ29vZCB0byBtZS4KPj4KPj4gSGkgQ2hyaXMsCj4+Cj4+IFNpbmNlIHRoZXJlIGlzIG9u
bHkgb25lIGxpbmUgdW5kZXIgImVsc2UiLCBJIGRyb3BwZWQgdGhlICJ7fSIuIEkgdGhvdWdodCB0
aGF0IGlzIG9rYXkgaW4gY3VycmVudAo+PiBrZXJuZWwgY29kaW5nIHN0eWxlIGFuZCBjaGVja3Bh
dGNoLnBsIGFsc28gc2hvd3Mgbm8gY29tcGxhaW4uCj4+Cj4+IFNvIHlvdSBtZWFuIHlvdSB3YW50
IHRoZSBjb2RlIHRvIGJlIHRoZSBmb2xsb3dpbmc/Cj4+Cj4+IH0gZWxzZSB7Cj4+ICAgICAgICAg
ICAgICAgICAgcmV0ID0gYWRldi0+cGNpZV9ycmVnKGFkZXYsIHJlZyAqIDQpOwo+PiB9Cj4+Cj4+
IEkgY2FuIG1ha2UgdGhlIGNoYW5nZSBhbnl3YXkuIERvZXMgdGhhdCBtZWFuIEkgY2FuIGdldCB5
b3VyIFJCIHdpdGggY29kaW5nIHN0eWxlIGNoYW5nZQo+PiBmb3IgdGhlIHNlcmllcz8KPj4KPj4g
UmVnYXJkcywKPj4gSGF3a2luZwo+Pgo+Pgo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+
PiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNv
bT4KPj4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMTgsIDIwMjAgMTk6MjcKPj4gVG86IFpoYW5n
LCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgRGV1Y2hlciwKPj4gQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29t
PjsgV2FuZywgS2V2aW4oWWFuZykKPj4gPEtldmluMS5XYW5nQGFtZC5jb20+OyBLb2VuaWcsIENo
cmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgQ2hlbiwgR3VjaHVuCj4+IDxHdWNo
dW4uQ2hlbkBhbWQuY29tPgo+PiBTdWJqZWN0OiBSZTogW1BBVENIIDMvM10gZHJtL2FtZGdwdTog
c3VwcG9ydCBpbmRpcmVjdCBhY2Nlc3MgcmVnIG91dHNpZGUgb2YgbW1pbyBiYXIgKHYyKQo+Pgo+
PiBBbSAxOC4wOS4yMCB1bSAxMTo1MSBzY2hyaWViIEhhd2tpbmcgWmhhbmc6Cj4+PiBzdXBwb3J0
IGJvdGggZGlyZWN0IGFuZCBpbmRpcmVjdCBhY2Nlc3NvciBpbiB1bmlmaWVkIGhlbHBlciBmdW5j
dGlvbnMuCj4+Pgo+Pj4gdjI6IFJldGlyZSBpbmRpcmVjdCBtbWlvIGFjY2VzcyB2aWEgbW1faW5k
ZXgvZGF0YQo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhh
bmdAYW1kLmNvbT4KPj4+IC0tLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmggICAgICAgICB8IDIzICsrKy0tLS0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgfCAgMiArLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jICB8IDk2ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
Cj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHJhY2UuaCAgIHwgIDQg
Ky0KPj4+ICAgIDQgZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgNzQgZGVsZXRpb25z
KC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5oCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4+PiBpbmRleCA0
MGVlNDRiLi41MDM0MWYwIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1LmgKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5o
Cj4+PiBAQCAtMTAxOSwxMiArMTAxOSwxMyBAQCBpbnQgYW1kZ3B1X2dwdV93YWl0X2Zvcl9pZGxl
KHN0cnVjdAo+Pj4gYW1kZ3B1X2RldmljZSAqYWRldik7Cj4+Pgo+Pj4gICAgdm9pZCBhbWRncHVf
ZGV2aWNlX3ZyYW1fYWNjZXNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBsb2ZmX3QgcG9z
LAo+Pj4gICAgCQkJICAgICAgIHVpbnQzMl90ICpidWYsIHNpemVfdCBzaXplLCBib29sIHdyaXRl
KTsgLXVpbnQzMl90Cj4+PiBhbWRncHVfbW1fcnJlZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwgdWludDMyX3QgcmVnLAo+Pj4gK3VpbnQzMl90IGFtZGdwdV9kZXZpY2VfcnJlZyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKPj4+ICsJCQkgICAgdWludDMyX3QgcmVnLCB1aW50MzJfdCBh
Y2NfZmxhZ3MpOyB2b2lkCj4+PiArYW1kZ3B1X2RldmljZV93cmVnKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LAo+Pj4gKwkJCXVpbnQzMl90IHJlZywgdWludDMyX3QgdiwKPj4+ICAgIAkJCXVp
bnQzMl90IGFjY19mbGFncyk7Cj4+PiAtdm9pZCBhbWRncHVfbW1fd3JlZyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwgdWludDMyX3QgcmVnLCB1aW50MzJfdCB2LAo+Pj4gLQkJICAgIHVpbnQz
Ml90IGFjY19mbGFncyk7Cj4+PiAtdm9pZCBhbWRncHVfbW1fd3JlZ19tbWlvX3JsYyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgcmVnLCB1aW50MzJfdCB2LAo+Pj4gLQkJICAg
IHVpbnQzMl90IGFjY19mbGFncyk7Cj4+PiArdm9pZCBhbWRncHVfbW1fd3JlZ19tbWlvX3JsYyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPj4+ICsJCQkgICAgIHVpbnQzMl90IHJlZywgdWlu
dDMyX3Qgdik7Cj4+PiAgICB2b2lkIGFtZGdwdV9tbV93cmVnOChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgdWludDMyX3Qgb2Zmc2V0LCB1aW50OF90IHZhbHVlKTsKPj4+ICAgIHVpbnQ4X3Qg
YW1kZ3B1X21tX3JyZWc4KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdAo+Pj4g
b2Zmc2V0KTsKPj4+Cj4+PiBAQCAtMTA1NCw4ICsxMDU1LDggQEAgaW50IGVtdV9zb2NfYXNpY19p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKPj4+ICAgICAqLwo+Pj4gICAgI2RlZmlu
ZSBBTURHUFVfUkVHU19OT19LSVEgICAgKDE8PDEpCj4+Pgo+Pj4gLSNkZWZpbmUgUlJFRzMyX05P
X0tJUShyZWcpIGFtZGdwdV9tbV9ycmVnKGFkZXYsIChyZWcpLAo+Pj4gQU1ER1BVX1JFR1NfTk9f
S0lRKSAtI2RlZmluZSBXUkVHMzJfTk9fS0lRKHJlZywgdikKPj4+IGFtZGdwdV9tbV93cmVnKGFk
ZXYsIChyZWcpLCAodiksIEFNREdQVV9SRUdTX05PX0tJUSkKPj4+ICsjZGVmaW5lIFJSRUczMl9O
T19LSVEocmVnKSBhbWRncHVfZGV2aWNlX3JyZWcoYWRldiwgKHJlZyksCj4+PiArQU1ER1BVX1JF
R1NfTk9fS0lRKSAjZGVmaW5lIFdSRUczMl9OT19LSVEocmVnLCB2KQo+Pj4gK2FtZGdwdV9kZXZp
Y2Vfd3JlZyhhZGV2LCAocmVnKSwgKHYpLCBBTURHUFVfUkVHU19OT19LSVEpCj4+Pgo+Pj4gICAg
I2RlZmluZSBSUkVHMzJfS0lRKHJlZykgYW1kZ3B1X2tpcV9ycmVnKGFkZXYsIChyZWcpKQo+Pj4g
ICAgI2RlZmluZSBXUkVHMzJfS0lRKHJlZywgdikgYW1kZ3B1X2tpcV93cmVnKGFkZXYsIChyZWcp
LCAodikpIEBACj4+PiAtMTA2Myw5ICsxMDY0LDkgQEAgaW50IGVtdV9zb2NfYXNpY19pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKPj4+ICAgICNkZWZpbmUgUlJFRzgocmVnKSBhbWRn
cHVfbW1fcnJlZzgoYWRldiwgKHJlZykpCj4+PiAgICAjZGVmaW5lIFdSRUc4KHJlZywgdikgYW1k
Z3B1X21tX3dyZWc4KGFkZXYsIChyZWcpLCAodikpCj4+Pgo+Pj4gLSNkZWZpbmUgUlJFRzMyKHJl
ZykgYW1kZ3B1X21tX3JyZWcoYWRldiwgKHJlZyksIDApIC0jZGVmaW5lCj4+PiBEUkVHMzIocmVn
KSBwcmludGsoS0VSTl9JTkZPICJSRUdJU1RFUjogIiAjcmVnICIgOiAweCUwOFhcbiIsCj4+PiBh
bWRncHVfbW1fcnJlZyhhZGV2LCAocmVnKSwgMCkpIC0jZGVmaW5lIFdSRUczMihyZWcsIHYpCj4+
PiBhbWRncHVfbW1fd3JlZyhhZGV2LCAocmVnKSwgKHYpLCAwKQo+Pj4gKyNkZWZpbmUgUlJFRzMy
KHJlZykgYW1kZ3B1X2RldmljZV9ycmVnKGFkZXYsIChyZWcpLCAwKSAjZGVmaW5lCj4+PiArRFJF
RzMyKHJlZykgcHJpbnRrKEtFUk5fSU5GTyAiUkVHSVNURVI6ICIgI3JlZyAiIDogMHglMDhYXG4i
LAo+Pj4gK2FtZGdwdV9kZXZpY2VfcnJlZyhhZGV2LCAocmVnKSwgMCkpICNkZWZpbmUgV1JFRzMy
KHJlZywgdikKPj4+ICthbWRncHVfZGV2aWNlX3dyZWcoYWRldiwgKHJlZyksICh2KSwgMCkKPj4+
ICAgICNkZWZpbmUgUkVHX1NFVChGSUVMRCwgdikgKCgodikgPDwgRklFTEQjI19TSElGVCkgJiBG
SUVMRCMjX01BU0spCj4+PiAgICAjZGVmaW5lIFJFR19HRVQoRklFTEQsIHYpICgoKHYpIDw8IEZJ
RUxEIyNfU0hJRlQpICYgRklFTEQjI19NQVNLKQo+Pj4gICAgI2RlZmluZSBSUkVHMzJfUENJRShy
ZWcpIGFkZXYtPnBjaWVfcnJlZyhhZGV2LCAocmVnKSkgQEAgLTExMTEsNwo+Pj4gKzExMTIsNyBA
QCBpbnQgZW11X3NvY19hc2ljX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwo+Pj4g
ICAgCQlXUkVHMzJfU01DKF9SZWcsIHRtcCk7ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+
PiAgICAJfSB3aGlsZSAoMCkKPj4+Cj4+PiAtI2RlZmluZSBEUkVHMzJfU1lTKHNxZiwgYWRldiwg
cmVnKSBzZXFfcHJpbnRmKChzcWYpLCAjcmVnICIgOgo+Pj4gMHglMDhYXG4iLCBhbWRncHVfbW1f
cnJlZygoYWRldiksIChyZWcpLCBmYWxzZSkpCj4+PiArI2RlZmluZSBEUkVHMzJfU1lTKHNxZiwg
YWRldiwgcmVnKSBzZXFfcHJpbnRmKChzcWYpLCAjcmVnICIgOgo+Pj4gKzB4JTA4WFxuIiwgYW1k
Z3B1X2RldmljZV9ycmVnKChhZGV2KSwgKHJlZyksIGZhbHNlKSkKPj4+ICAgICNkZWZpbmUgUlJF
RzMyX0lPKHJlZykgYW1kZ3B1X2lvX3JyZWcoYWRldiwgKHJlZykpCj4+PiAgICAjZGVmaW5lIFdS
RUczMl9JTyhyZWcsIHYpIGFtZGdwdV9pb193cmVnKGFkZXYsIChyZWcpLCAodikpCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMK
Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYwo+Pj4gaW5k
ZXggYWJlMGMyNy4uMmQxMjViOCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKPj4+IEBAIC0yNjcsNyArMjY3LDcgQEAgc3RhdGljIGludCAg
YW1kZ3B1X2RlYnVnZnNfcHJvY2Vzc19yZWdfb3AoYm9vbCByZWFkLCBzdHJ1Y3QgZmlsZQo+PiAq
ZiwKPj4+ICAgIAkJfSBlbHNlIHsKPj4+ICAgIAkJCXIgPSBnZXRfdXNlcih2YWx1ZSwgKHVpbnQz
Ml90ICopYnVmKTsKPj4+ICAgIAkJCWlmICghcikKPj4+IC0JCQkJYW1kZ3B1X21tX3dyZWdfbW1p
b19ybGMoYWRldiwgKnBvcyA+PiAyLCB2YWx1ZSwgMCk7Cj4+PiArCQkJCWFtZGdwdV9tbV93cmVn
X21taW9fcmxjKGFkZXYsICpwb3MgPj4gMiwgdmFsdWUpOwo+Pj4gICAgCQl9Cj4+PiAgICAJCWlm
IChyKSB7Cj4+PiAgICAJCQlyZXN1bHQgPSByOwo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPj4+IGluZGV4IDc3Nzg1YjIuLmJlZWY3NjQgMTAwNjQ0
Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+Pj4gQEAg
LTMwMywxMCArMzAzLDEwIEBAIHZvaWQgYW1kZ3B1X2RldmljZV92cmFtX2FjY2VzcyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZQo+PiAqYWRldiwgbG9mZl90IHBvcywKPj4+ICAgIH0KPj4+Cj4+PiAgICAv
Kgo+Pj4gLSAqIE1NSU8gcmVnaXN0ZXIgYWNjZXNzIGhlbHBlciBmdW5jdGlvbnMuCj4+PiArICog
cmVnaXN0ZXIgYWNjZXNzIGhlbHBlciBmdW5jdGlvbnMuCj4+PiAgICAgKi8KPj4+ICAgIC8qKgo+
Pj4gLSAqIGFtZGdwdV9tbV9ycmVnIC0gcmVhZCBhIG1lbW9yeSBtYXBwZWQgSU8gcmVnaXN0ZXIK
Pj4+ICsgKiBhbWRncHVfZGV2aWNlX3JyZWcgLSByZWFkIGEgbWVtb3J5IG1hcHBlZCBJTyBvciBp
bmRpcmVjdCByZWdpc3Rlcgo+Pj4gICAgICoKPj4+ICAgICAqIEBhZGV2OiBhbWRncHVfZGV2aWNl
IHBvaW50ZXIKPj4+ICAgICAqIEByZWc6IGR3b3JkIGFsaWduZWQgcmVnaXN0ZXIgb2Zmc2V0IEBA
IC0zMTQsMzMgKzMxNCwyNyBAQCB2b2lkCj4+PiBhbWRncHVfZGV2aWNlX3ZyYW1fYWNjZXNzKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBsb2ZmX3QgcG9zLAo+Pj4gICAgICoKPj4+ICAgICAq
IFJldHVybnMgdGhlIDMyIGJpdCB2YWx1ZSBmcm9tIHRoZSBvZmZzZXQgc3BlY2lmaWVkLgo+Pj4g
ICAgICovCj4+PiAtdWludDMyX3QgYW1kZ3B1X21tX3JyZWcoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIHVpbnQzMl90IHJlZywKPj4+IC0JCQl1aW50MzJfdCBhY2NfZmxhZ3MpCj4+PiArdWlu
dDMyX3QgYW1kZ3B1X2RldmljZV9ycmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+Pj4g
KwkJCSAgICB1aW50MzJfdCByZWcsIHVpbnQzMl90IGFjY19mbGFncykKPj4+ICAgIHsKPj4+ICAg
IAl1aW50MzJfdCByZXQ7Cj4+Pgo+Pj4gICAgCWlmIChhZGV2LT5pbl9wY2lfZXJyX3JlY292ZXJ5
KQo+Pj4gICAgCQlyZXR1cm4gMDsKPj4+Cj4+PiAtCWlmICghKGFjY19mbGFncyAmIEFNREdQVV9S
RUdTX05PX0tJUSkgJiYgYW1kZ3B1X3NyaW92X3J1bnRpbWUoYWRldikgJiYKPj4+IC0JICAgIGRv
d25fcmVhZF90cnlsb2NrKCZhZGV2LT5yZXNldF9zZW0pKSB7Cj4+PiAtCQlyZXQgPSBhbWRncHVf
a2lxX3JyZWcoYWRldiwgcmVnKTsKPj4+IC0JCXVwX3JlYWQoJmFkZXYtPnJlc2V0X3NlbSk7Cj4+
PiAtCQlyZXR1cm4gcmV0Owo+Pj4gLQl9Cj4+PiAtCj4+PiAtCWlmICgocmVnICogNCkgPCBhZGV2
LT5ybW1pb19zaXplKQo+Pj4gLQkJcmV0ID0gcmVhZGwoKCh2b2lkIF9faW9tZW0gKilhZGV2LT5y
bW1pbykgKyAocmVnICogNCkpOwo+Pj4gLQllbHNlIHsKPj4+IC0JCXVuc2lnbmVkIGxvbmcgZmxh
Z3M7Cj4+PiArCWlmICgocmVnICogNCkgPCBhZGV2LT5ybW1pb19zaXplKSB7Cj4+PiArCQlpZiAo
IShhY2NfZmxhZ3MgJiBBTURHUFVfUkVHU19OT19LSVEpICYmCj4+PiArCQkgICAgYW1kZ3B1X3Ny
aW92X3J1bnRpbWUoYWRldikgJiYKPj4+ICsJCSAgICBkb3duX3JlYWRfdHJ5bG9jaygmYWRldi0+
cmVzZXRfc2VtKSkgewo+Pj4gKwkJCXJldCA9IGFtZGdwdV9raXFfcnJlZyhhZGV2LCByZWcpOwo+
Pj4gKwkJCXVwX3JlYWQoJmFkZXYtPnJlc2V0X3NlbSk7Cj4+PiArCQl9IGVsc2UKPj4+ICsJCQly
ZXQgPSByZWFkbCgoKHZvaWQgX19pb21lbSAqKWFkZXYtPnJtbWlvKSArIChyZWcgKiA0KSk7Cj4+
PiArCX0gZWxzZQo+PiBUaGlzIHNob3VsZCB1c2UgIn0gZWxzZSB7Ii4gQXBhcnQgZnJvbSB0aGF0
IGxvb2tzIGdvb2QgdG8gbWUuCj4+Cj4+IENocmlzdGlhbi4KPj4KPj4+ICsJCXJldCA9IGFkZXYt
PnBjaWVfcnJlZyhhZGV2LCByZWcgKiA0KTsKPj4+Cj4+PiAtCQlzcGluX2xvY2tfaXJxc2F2ZSgm
YWRldi0+bW1pb19pZHhfbG9jaywgZmxhZ3MpOwo+Pj4gLQkJd3JpdGVsKChyZWcgKiA0KSwgKCh2
b2lkIF9faW9tZW0gKilhZGV2LT5ybW1pbykgKyAobW1NTV9JTkRFWCAqIDQpKTsKPj4+IC0JCXJl
dCA9IHJlYWRsKCgodm9pZCBfX2lvbWVtICopYWRldi0+cm1taW8pICsgKG1tTU1fREFUQSAqIDQp
KTsKPj4+IC0JCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPm1taW9faWR4X2xvY2ssIGZs
YWdzKTsKPj4+IC0JfQo+Pj4gKwl0cmFjZV9hbWRncHVfZGV2aWNlX3JyZWcoYWRldi0+cGRldi0+
ZGV2aWNlLCByZWcsIHJldCk7Cj4+Pgo+Pj4gLQl0cmFjZV9hbWRncHVfbW1fcnJlZyhhZGV2LT5w
ZGV2LT5kZXZpY2UsIHJlZywgcmV0KTsKPj4+ICAgIAlyZXR1cm4gcmV0Owo+Pj4gICAgfQo+Pj4K
Pj4+IEBAIC0zOTQsMjkgKzM4OCw4IEBAIHZvaWQgYW1kZ3B1X21tX3dyZWc4KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LCB1aW50MzJfdAo+PiBvZmZzZXQsIHVpbnQ4X3QgdmFsdWUpCj4+PiAg
ICAJCUJVRygpOwo+Pj4gICAgfQo+Pj4KPj4+IC1zdGF0aWMgaW5saW5lIHZvaWQgYW1kZ3B1X21t
X3dyZWdfbW1pbyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPj4+IC0JCQkJICAgICAgIHVp
bnQzMl90IHJlZywgdWludDMyX3QgdiwKPj4+IC0JCQkJICAgICAgIHVpbnQzMl90IGFjY19mbGFn
cykKPj4+IC17Cj4+PiAtCWlmIChhZGV2LT5pbl9wY2lfZXJyX3JlY292ZXJ5KQo+Pj4gLQkJcmV0
dXJuOwo+Pj4gLQo+Pj4gLQl0cmFjZV9hbWRncHVfbW1fd3JlZyhhZGV2LT5wZGV2LT5kZXZpY2Us
IHJlZywgdik7Cj4+PiAtCj4+PiAtCWlmICgocmVnICogNCkgPCBhZGV2LT5ybW1pb19zaXplKQo+
Pj4gLQkJd3JpdGVsKHYsICgodm9pZCBfX2lvbWVtICopYWRldi0+cm1taW8pICsgKHJlZyAqIDQp
KTsKPj4+IC0JZWxzZSB7Cj4+PiAtCQl1bnNpZ25lZCBsb25nIGZsYWdzOwo+Pj4gLQo+Pj4gLQkJ
c3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPm1taW9faWR4X2xvY2ssIGZsYWdzKTsKPj4+IC0JCXdy
aXRlbCgocmVnICogNCksICgodm9pZCBfX2lvbWVtICopYWRldi0+cm1taW8pICsgKG1tTU1fSU5E
RVggKiA0KSk7Cj4+PiAtCQl3cml0ZWwodiwgKCh2b2lkIF9faW9tZW0gKilhZGV2LT5ybW1pbykg
KyAobW1NTV9EQVRBICogNCkpOwo+Pj4gLQkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+
bW1pb19pZHhfbG9jaywgZmxhZ3MpOwo+Pj4gLQl9Cj4+PiAtfQo+Pj4gLQo+Pj4gICAgLyoqCj4+
PiAtICogYW1kZ3B1X21tX3dyZWcgLSB3cml0ZSB0byBhIG1lbW9yeSBtYXBwZWQgSU8gcmVnaXN0
ZXIKPj4+ICsgKiBhbWRncHVfZGV2aWNlX3dyZWcgLSB3cml0ZSB0byBhIG1lbW9yeSBtYXBwZWQg
SU8gb3IgaW5kaXJlY3QKPj4+ICsgcmVnaXN0ZXIKPj4+ICAgICAqCj4+PiAgICAgKiBAYWRldjog
YW1kZ3B1X2RldmljZSBwb2ludGVyCj4+PiAgICAgKiBAcmVnOiBkd29yZCBhbGlnbmVkIHJlZ2lz
dGVyIG9mZnNldCBAQCAtNDI1LDIwICszOTgsMjUgQEAgc3RhdGljCj4+PiBpbmxpbmUgdm9pZCBh
bWRncHVfbW1fd3JlZ19tbWlvKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+Pj4gICAgICoK
Pj4+ICAgICAqIFdyaXRlcyB0aGUgdmFsdWUgc3BlY2lmaWVkIHRvIHRoZSBvZmZzZXQgc3BlY2lm
aWVkLgo+Pj4gICAgICovCj4+PiAtdm9pZCBhbWRncHVfbW1fd3JlZyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwgdWludDMyX3QgcmVnLCB1aW50MzJfdCB2LAo+Pj4gLQkJICAgIHVpbnQzMl90
IGFjY19mbGFncykKPj4+ICt2b2lkIGFtZGdwdV9kZXZpY2Vfd3JlZyhzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKPj4+ICsJCQl1aW50MzJfdCByZWcsIHVpbnQzMl90IHYsCj4+PiArCQkJdWlu
dDMyX3QgYWNjX2ZsYWdzKQo+Pj4gICAgewo+Pj4gICAgCWlmIChhZGV2LT5pbl9wY2lfZXJyX3Jl
Y292ZXJ5KQo+Pj4gICAgCQlyZXR1cm47Cj4+Pgo+Pj4gLQlpZiAoIShhY2NfZmxhZ3MgJiBBTURH
UFVfUkVHU19OT19LSVEpICYmIGFtZGdwdV9zcmlvdl9ydW50aW1lKGFkZXYpICYmCj4+PiAtCSAg
ICBkb3duX3JlYWRfdHJ5bG9jaygmYWRldi0+cmVzZXRfc2VtKSkgewo+Pj4gLQkJYW1kZ3B1X2tp
cV93cmVnKGFkZXYsIHJlZywgdik7Cj4+PiAtCQl1cF9yZWFkKCZhZGV2LT5yZXNldF9zZW0pOwo+
Pj4gLQkJcmV0dXJuOwo+Pj4gLQl9Cj4+PiArCWlmICgocmVnICogNCkgPCBhZGV2LT5ybW1pb19z
aXplKSB7Cj4+PiArCQlpZiAoIShhY2NfZmxhZ3MgJiBBTURHUFVfUkVHU19OT19LSVEpICYmCj4+
PiArCQkgICAgYW1kZ3B1X3NyaW92X3J1bnRpbWUoYWRldikgJiYKPj4+ICsJCSAgICBkb3duX3Jl
YWRfdHJ5bG9jaygmYWRldi0+cmVzZXRfc2VtKSkgewo+Pj4gKwkJCWFtZGdwdV9raXFfd3JlZyhh
ZGV2LCByZWcsIHYpOwo+Pj4gKwkJCXVwX3JlYWQoJmFkZXYtPnJlc2V0X3NlbSk7Cj4+PiArCQl9
IGVsc2UKPj4+ICsJCQl3cml0ZWwodiwgKCh2b2lkIF9faW9tZW0gKilhZGV2LT5ybW1pbykgKyAo
cmVnICogNCkpOwo+Pj4gKwl9IGVsc2UKPj4+ICsJCWFkZXYtPnBjaWVfd3JlZyhhZGV2LCByZWcg
KiA0LCB2KTsKPj4+Cj4+PiAtCWFtZGdwdV9tbV93cmVnX21taW8oYWRldiwgcmVnLCB2LCBhY2Nf
ZmxhZ3MpOwo+Pj4gKwl0cmFjZV9hbWRncHVfZGV2aWNlX3dyZWcoYWRldi0+cGRldi0+ZGV2aWNl
LCByZWcsIHYpOwo+Pj4gICAgfQo+Pj4KPj4+ICAgIC8qCj4+PiBAQCAtNDQ2LDIxICs0MjQsMTkg
QEAgdm9pZCBhbWRncHVfbW1fd3JlZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMy
X3QKPj4gcmVnLCB1aW50MzJfdCB2LAo+Pj4gICAgICoKPj4+ICAgICAqIHRoaXMgZnVuY3Rpb24g
aXMgaW52b2tlZCBvbmx5IHRoZSBkZWJ1Z2ZzIHJlZ2lzdGVyIGFjY2Vzcwo+Pj4gICAgICogKi8K
Pj4+IC12b2lkIGFtZGdwdV9tbV93cmVnX21taW9fcmxjKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCB1aW50MzJfdCByZWcsIHVpbnQzMl90IHYsCj4+PiAtCQkgICAgdWludDMyX3QgYWNjX2Zs
YWdzKQo+Pj4gK3ZvaWQgYW1kZ3B1X21tX3dyZWdfbW1pb19ybGMoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCj4+PiArCQkJICAgICB1aW50MzJfdCByZWcsIHVpbnQzMl90IHYpCj4+PiAgICB7
Cj4+PiAgICAJaWYgKGFkZXYtPmluX3BjaV9lcnJfcmVjb3ZlcnkpCj4+PiAgICAJCXJldHVybjsK
Pj4+Cj4+PiAgICAJaWYgKGFtZGdwdV9zcmlvdl9mdWxsYWNjZXNzKGFkZXYpICYmCj4+PiAtCQlh
ZGV2LT5nZngucmxjLmZ1bmNzICYmCj4+PiAtCQlhZGV2LT5nZngucmxjLmZ1bmNzLT5pc19ybGNn
X2FjY2Vzc19yYW5nZSkgewo+Pj4gLQo+Pj4gKwkgICAgYWRldi0+Z2Z4LnJsYy5mdW5jcyAmJgo+
Pj4gKwkgICAgYWRldi0+Z2Z4LnJsYy5mdW5jcy0+aXNfcmxjZ19hY2Nlc3NfcmFuZ2UpIHsKPj4+
ICAgIAkJaWYgKGFkZXYtPmdmeC5ybGMuZnVuY3MtPmlzX3JsY2dfYWNjZXNzX3JhbmdlKGFkZXYs
IHJlZykpCj4+PiAgICAJCQlyZXR1cm4gYWRldi0+Z2Z4LnJsYy5mdW5jcy0+cmxjZ193cmVnKGFk
ZXYsIHJlZywgdik7Cj4+PiAtCX0KPj4+IC0KPj4+IC0JYW1kZ3B1X21tX3dyZWdfbW1pbyhhZGV2
LCByZWcsIHYsIGFjY19mbGFncyk7Cj4+PiArCX0gZWxzZQo+Pj4gKwkJd3JpdGVsKHYsICgodm9p
ZCBfX2lvbWVtICopYWRldi0+cm1taW8pICsgKHJlZyAqIDQpKTsKPj4+ICAgIH0KPj4+Cj4+PiAg
ICAvKioKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHJhY2UuaAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHJhY2UuaAo+
Pj4gaW5kZXggNjNlNzM0YS4uNWRhMjBmYyAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90cmFjZS5oCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHJhY2UuaAo+Pj4gQEAgLTM1LDcgKzM1LDcgQEAKPj4+ICAgICNkZWZp
bmUgQU1ER1BVX0pPQl9HRVRfVElNRUxJTkVfTkFNRShqb2IpIFwKPj4+Cj4+PiBqb2ItPmJhc2Uu
c19mZW5jZS0+ZmluaXNoZWQub3BzLT5nZXRfdGltZWxpbmVfbmFtZSgmam9iLT5iYXNlLnNfZmVu
Y2UtCj4+Pj4gZmluaXNoZWQpCj4+PiAtVFJBQ0VfRVZFTlQoYW1kZ3B1X21tX3JyZWcsCj4+PiAr
VFJBQ0VfRVZFTlQoYW1kZ3B1X2RldmljZV9ycmVnLAo+Pj4gICAgCSAgICBUUF9QUk9UTyh1bnNp
Z25lZCBkaWQsIHVpbnQzMl90IHJlZywgdWludDMyX3QgdmFsdWUpLAo+Pj4gICAgCSAgICBUUF9B
UkdTKGRpZCwgcmVnLCB2YWx1ZSksCj4+PiAgICAJICAgIFRQX1NUUlVDVF9fZW50cnkoCj4+PiBA
QCAtNTQsNyArNTQsNyBAQCBUUkFDRV9FVkVOVChhbWRncHVfbW1fcnJlZywKPj4+ICAgIAkJICAg
ICAgKHVuc2lnbmVkIGxvbmcpX19lbnRyeS0+dmFsdWUpCj4+PiAgICApOwo+Pj4KPj4+IC1UUkFD
RV9FVkVOVChhbWRncHVfbW1fd3JlZywKPj4+ICtUUkFDRV9FVkVOVChhbWRncHVfZGV2aWNlX3dy
ZWcsCj4+PiAgICAJICAgIFRQX1BST1RPKHVuc2lnbmVkIGRpZCwgdWludDMyX3QgcmVnLCB1aW50
MzJfdCB2YWx1ZSksCj4+PiAgICAJICAgIFRQX0FSR1MoZGlkLCByZWcsIHZhbHVlKSwKPj4+ICAg
IAkgICAgVFBfU1RSVUNUX19lbnRyeSgKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4gYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3IKPj4gZyUy
Rm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC0KPj4gZ2Z4JmFtcDtkYXRhPTAyJTdDMDElN0NrZW50
LnJ1c3NlbGwlNDBhbWQuY29tJTdDYjA0Y2IyNTFkZDJhNDlmYzMyMmMwOGQ4NWJjYgo+PiA1YzEw
JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzM2MDI3NjI3
ODQ2ODI0MSZhbXA7Cj4+IHNkYXRhPWR4RkNhc3hVSXJ2alBmbmZ0N0VRdU0xQkZiTnd6Z05TV2RS
WDBsJTJCVjBsOCUzRCZhbXA7cmVzZXJ2ZWQ9MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cg==
