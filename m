Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB610D1FE
	for <lists+amd-gfx@lfdr.de>; Fri, 29 Nov 2019 08:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425906E891;
	Fri, 29 Nov 2019 07:45:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700046.outbound.protection.outlook.com [40.107.70.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140F16E891
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 Nov 2019 07:45:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXvNSxmkpCxTajvmjSe3ZnOqlNKYS9AF6SsPFsH14DTfsp1+cI+redphEYNAWv8Auc0y11CtswC/A46+rEPz026q8YREm0ZbVLA3SRWEVbEhcpB++ItNmiVHqYRID2Ye3hYVNJkadBZfFXhZr16b3yzoqC50vyDnCnCXPJmd7Caaw4ueDnWc8jyobeqBCA3Ph8ygE5Z28Z3JLgmkfG27ir6n8IEc7KVCidexrdyzXQiIuzJrBp9OKmHyLxfdR5t5fnc+A72viF/jnqmOgKUw2P0/49vZTXm3JblEZZfJvqgJpjuHyDFhD+ROX9kWNO7OaDuhJUw2G4BOzmGbgZ7yZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO1XXNPTEgB+Uajkl27IrGS5KU7I+2sqDrd4JMZBPcc=;
 b=UnlVmAg+Va8LbyT2/2I8pfsOVB0X9tJV+otwv9jTJly4z49rPFUnKz3ThOcrVmiTUtSJoiADXHRKGR3lnNjUHHwUQHqw2kbYBBikb58tW+CPntfnvgH/afzJdChgHTUnirnhkPmxACJVSqXeh9lxohm3jzlqwJiSPhqsD6NO26qCEeHtD8xCneC6XVaD87vubLSL6vpJylCtjjmTRvFuBeasGmD7UlsmjGyTS8M0fUxaHtUPUaxB//HJgZjpxKg5IQCmVH1vd+DE0pLcxh1oyi5X4edsxsux4EGtN7aT+zES9Ho2EKtM+Hep+u39xrt/f5nfrV1ouD06T8auae2E2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1515.namprd12.prod.outlook.com (10.172.35.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Fri, 29 Nov 2019 07:45:55 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84%12]) with mapi id 15.20.2495.014; Fri, 29 Nov 2019
 07:45:54 +0000
Subject: Re: [PATCH 5/5] drm/amdgpu: fix calltrace during kmd unload
To: "Liu, Monk" <Monk.Liu@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <1574769024-30611-1-git-send-email-Monk.Liu@amd.com>
 <1574769024-30611-5-git-send-email-Monk.Liu@amd.com>
 <7D1BEE15-D37F-4821-9DFF-CC1DD258A2CB@amd.com>
 <MN2PR12MB3933457BEF5A0AAAC37BE79184470@MN2PR12MB3933.namprd12.prod.outlook.com>
 <6d31ba81-c01d-f334-7c14-fb6964674d97@gmail.com>
 <MN2PR12MB3933467E1137D45E8B81A85184460@MN2PR12MB3933.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e62b7e52-8d43-5b0d-af4e-98f6316ccec1@amd.com>
Date: Fri, 29 Nov 2019 08:45:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <MN2PR12MB3933467E1137D45E8B81A85184460@MN2PR12MB3933.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0042.eurprd05.prod.outlook.com
 (2603:10a6:208:be::19) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 90c6a595-72f2-43a5-b153-08d774a029fb
X-MS-TrafficTypeDiagnostic: DM5PR12MB1515:|DM5PR12MB1515:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1515D7C67E7BE6F1A7CBB4ED83460@DM5PR12MB1515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 0236114672
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(199004)(189003)(51914003)(13464003)(8676002)(7736002)(305945005)(25786009)(58126008)(316002)(81166006)(99286004)(8936002)(2906002)(81156014)(2870700001)(6116002)(50466002)(31686004)(14454004)(6246003)(53546011)(186003)(6506007)(386003)(4326008)(47776003)(110136005)(76176011)(66556008)(14444005)(11346002)(46003)(2616005)(446003)(45080400002)(6436002)(36756003)(229853002)(6636002)(6486002)(66476007)(2486003)(478600001)(6512007)(23676004)(86362001)(31696002)(65956001)(66946007)(6666004)(66574012)(52116002)(966005)(5660300002)(6306002)(65806001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1515;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PrIRttQK2JzgmT8N/D9CihmGc/HReopH+yRQLDLmeHuQ3jDCKeLkU/2VCUBeGFwFdLu0KdVRg6e9X581K8n7Q/rH9l+5N19fDXAORgNfS8ypc657xLPlo/8KtEkpu+dvbMla/R3hL9hu6L5vqkKB3UQoA86pzNkgtlrRICOSs0Its2aYZAXosMzBMc7rDnMc+gJyOyr9zeB76Bs+x/n2zzunWBGu0bPpVi7yNC1VvEQQI7p4tV1fgkFFelv9gyD689bkMMyofYER/0MTL4MCF8LWWQSew7WK2/HKbKt3JnSp8fHj6ykq9vi87pC/U13J6lJeLAp6iLfw6dziC/Czri5bBIS5/m3CvHpDpjbMIzM0BAA+LwI9KtB9pDN5AuQPd8T4jgiKuTxVcUzMV+dGHhNitppq25a0UBSdx2Mqat34URiARvkwriDMVK0PUSF8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c6a595-72f2-43a5-b153-08d774a029fb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2019 07:45:54.7293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtlLPFV4veR33x4mOtl+4rZZUV0AX9TOlKlCztLIQ/rRVKqhcMtyUu5daHSdWG+O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1515
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO1XXNPTEgB+Uajkl27IrGS5KU7I+2sqDrd4JMZBPcc=;
 b=EITABNLzfRh0iOnMl+WhJxVim5uD1W5S5pjSZPUGS3hXukIczfUF7ao2RuN1JLC7bXiLjjtE+gnsGH6HFY1S2SdgURXyt7GMSvwpTvOvGItINVRrHLST2k/Xu7ZU6BP6ICVJ4bFb5EWOZmgwUomHxuXlSU3xrWvSQ5Deh3rlT/0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gdGhpcyBjYXNlIGZlZWwgZnJlZSB0byBhZGQgYW4gQWNrZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgCjxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHRvIHlvdXIgcGF0Y2guCgpCdXQgSSB3b3Vs
ZCByZWNvbW1lbmQgdG8gZ2V0IGFuIHJiIGZyb20gc29tZWJvZHkgd2hpY2gga25vd3MgdGhhdCBz
dHVmZiAKYmV0dGVyIHRoYW4gSSBkby4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCkFtIDI5LjExLjE5
IHVtIDAyOjU4IHNjaHJpZWIgTGl1LCBNb25rOgo+IFRoZSBjb250ZW50IG9mIENTSUIgaXMgYWx3
YXlzIHN0YXRpYywgSSBzdWJtaXR0ZWQgYSBwYXRjaCB0byB1c2UgdGhlIHJlLWluaXQgYW5kIGdl
dCByaWQgb2YgcGluL3VucGluIENTSUIgaW4gaHdfaW5pL2ZpbmksICAobXkgcHVycG9zZSBpcyB0
byBmaXggdGhlIGRvdWJsZSB1bnBpbiB3YXJuaW5nIGR1cmluZyB1bmxvYWQgKQo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBNb25rIExpdXxHUFUgVmlydHVhbGl6YXRp
b24gVGVhbSB8QU1ECj4KPgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+Cj4gU2VudDog
VGh1cnNkYXksIE5vdmVtYmVyIDI4LCAyMDE5IDc6NTEgUE0KPiBUbzogTGl1LCBNb25rIDxNb25r
LkxpdUBhbWQuY29tPjsgWXVhbiwgWGlhb2ppZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+OyBEZXVj
aGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlz
dGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNS81XSBkcm0vYW1kZ3B1OiBmaXggY2Fs
bHRyYWNlIGR1cmluZyBrbWQgdW5sb2FkCj4KPiBIaSBNb25rLAo+Cj4gaWYgdGhlIGNvbnRlbnQg
b2YgdGhlIENTSUIgaXMgY29uc3RhbnQgdGhlbiBpdCBpcyBjZXJ0YWlubHkgYmV0dGVyIHRvIGp1
c3QgcmUtaW5pdGlhbGl6ZSBpdC4KPgo+IFRoaXMgYWxzbyBwcmV2ZW50cyBmcm9tIGNvcnJ1cHRp
b24gYmVjYXVzZSBvZiBWUkFNIGxvc3QuCj4KPiBDaHJpc3RpYW4uCj4KPiBBbSAyOC4xMS4xOSB1
bSAwMzo1MyBzY2hyaWViIExpdSwgTW9uazoKPj4gSGkgWGlhb2ppZQo+Pgo+PiBGb3IgU1JJT1Yg
d2UgZG9uJ3QgdXNlIHN1c3BlbmQgc28gSSBkaWRuJ3QgdGhpbmsgdG8gdGhhdCBwYXJ0LCB0aGFu
a3MgZm9yIHRoZSByZW1pbmQgIQo+PiBCdXQgd2Ugc3RpbGwgbmVlZCB0byBmaXggdGhpcyBjYWxs
IHRyYWNlIGlzc3VlIGFueXdheSAob3VyIGplbmtpbnMKPj4gdGVzdGluZyAgc3lzdGVtIGNvbnNp
ZGVyIHN1Y2ggY2FsbCB0cmFjZSBhcyBhbiBlcnJvciApCj4+Cj4+IEhvdyBhYm91dCB3ZSBkbyAi
ICBhZGV2LT5nZngucmxjLmZ1bmNzLT5nZXRfY3NiX2J1ZmZlcihhZGV2LAo+PiBkc3RfcHRyKTsi
IGluIHRoZSBod19pbml0KCkgPyB0aGlzIHdheSBZb3UgZG9uJ3QgbmVlZCB0byBldmljdCB0aGUg
Q1NJQiBkdXJpbmcgc3VzcGVuZCBhbmQgdGhlIENTSUIgYWx3YXlzIHdpbGwgYmUgcmUtaW5pdGlh
bGl6ZWQgYWZ0ZXIgUzMgcmVzdW1lID8KPj4KPj4gQERldWNoZXIsIEFsZXhhbmRlciBAS29lbmln
LCBDaHJpc3RpYW4gd2hhdCdzIHlvdXIgb3BpbmlvbiA/Cj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4gTW9uayBMaXV8R1BVIFZpcnR1YWxpemF0aW9uIFRlYW0gfEFN
RAo+Pgo+Pgo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBZdWFuLCBYaWFv
amllIDxYaWFvamllLll1YW5AYW1kLmNvbT4KPj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMjYs
IDIwMTkgOToxMCBQTQo+PiBUbzogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPgo+PiBDYzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gU3ViamVjdDogUmU6IFtQQVRDSCA1LzVd
IGRybS9hbWRncHU6IGZpeCBjYWxsdHJhY2UgZHVyaW5nIGttZCB1bmxvYWQKPj4KPj4gSGkgTW9u
aywKPj4KPj4gaHdfZmluaSgpIGlzIGNhbGxlZCBpbiBzdXNwZW5kIGNvZGUgcGF0aCBhcyB3ZWxs
LiBJJ20gd29uZGVyaW5nIGhvdyBjc2IgY2FuIGJlIGV2aWN0ZWQgaWYgaXQncyBub3QgdW5waW5l
ZCBiZWZvcmUgc3VzcGVuZC4KPj4KPj4gQlIsCj4+IFhpYW9qaWUKPj4KPj4+IE9uIE5vdiAyNiwg
MjAxOSwgYXQgNzo1MCBQTSwgTW9uayBMaXUgPE1vbmsuTGl1QGFtZC5jb20+IHdyb3RlOgo+Pj4K
Pj4+IGtlcm5lbCB3b3VsZCByZXBvcnQgYSB3YXJuaW5nIG9uIGRvdWJsZSB1bnBpbiBvbiB0aGUg
Y3NiIEJPIGJlY2F1c2UKPj4+IHdlIHVucGluIGl0IGR1cmluZyBod19maW5pIGJ1dCBhY3R1YWxs
eSB3ZSBkb24ndCBuZWVkIHRvIHBpbi91bnBpbiBpdAo+Pj4gZHVyaW5nIGh3X2luaXQvZmluaSBz
aW5jZSBpdCBpcyBjcmVhdGVkIHdpdGgga2VybmVsIHBpbm5lZAo+Pj4KPj4+IHJlbW92ZSBhbGwg
dGhvc2UgdXNlbGVzcyBjb2RlIGZvciBnZng5LzEwCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTW9u
ayBMaXUgPE1vbmsuTGl1QGFtZC5jb20+Cj4+PiAtLS0KPj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9ybGMuYyB8ICAxIC0KPj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92MTBfMC5jICB8IDM4IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgfCAzOSAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+IDMgZmlsZXMgY2hhbmdlZCwgNzggZGVsZXRpb25zKC0p
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
bGMuYwo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmxjLmMKPj4+IGlu
ZGV4IGM4NzkzZTYuLjI4OWZhZGEgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmxjLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9ybGMuYwo+Pj4gQEAgLTE0NSw3ICsxNDUsNiBAQCBpbnQgYW1kZ3B1X2dmeF9ybGNf
aW5pdF9jc2Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+PiAgICAgIGRzdF9wdHIgPSBh
ZGV2LT5nZngucmxjLmNzX3B0cjsKPj4+ICAgICAgYWRldi0+Z2Z4LnJsYy5mdW5jcy0+Z2V0X2Nz
Yl9idWZmZXIoYWRldiwgZHN0X3B0cik7Cj4+PiAgICAgIGFtZGdwdV9ib19rdW5tYXAoYWRldi0+
Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOwo+Pj4gLSAgICBhbWRncHVfYm9fdW5waW4oYWRldi0+
Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOwo+Pj4gICAgICBhbWRncHVfYm9fdW5yZXNlcnZlKGFk
ZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsKPj4+Cj4+PiAgICAgIHJldHVybiAwOwo+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCj4+PiBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCj4+PiBpbmRleCBhNTZjYmE5
Li41ZWU3NDY3IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3YxMF8wLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5j
Cj4+PiBAQCAtOTk2LDM5ICs5OTYsNiBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9ybGNfaW5pdChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPj4+ICAgICAgcmV0dXJuIDA7Cj4+PiB9Cj4+Pgo+
Pj4gLXN0YXRpYyBpbnQgZ2Z4X3YxMF8wX2NzYl92cmFtX3BpbihzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikgLXsKPj4+IC0gICAgaW50IHI7Cj4+PiAtCj4+PiAtICAgIHIgPSBhbWRncHVfYm9f
cmVzZXJ2ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaiwgZmFsc2UpOwo+Pj4gLSAgICBp
ZiAodW5saWtlbHkociAhPSAwKSkKPj4+IC0gICAgICAgIHJldHVybiByOwo+Pj4gLQo+Pj4gLSAg
ICByID0gYW1kZ3B1X2JvX3BpbihhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaiwKPj4+IC0g
ICAgICAgICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNKTsKPj4+IC0gICAgaWYgKCFyKQo+Pj4g
LSAgICAgICAgYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9ncHVfYWRkciA9Cj4+PiAtICAgICAg
ICAgICAgYW1kZ3B1X2JvX2dwdV9vZmZzZXQoYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmop
Owo+Pj4gLQo+Pj4gLSAgICBhbWRncHVfYm9fdW5yZXNlcnZlKGFkZXYtPmdmeC5ybGMuY2xlYXJf
c3RhdGVfb2JqKTsKPj4+IC0KPj4+IC0gICAgcmV0dXJuIHI7Cj4+PiAtfQo+Pj4gLQo+Pj4gLXN0
YXRpYyB2b2lkIGdmeF92MTBfMF9jc2JfdnJhbV91bnBpbihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikgLXsKPj4+IC0gICAgaW50IHI7Cj4+PiAtCj4+PiAtICAgIGlmICghYWRldi0+Z2Z4LnJs
Yy5jbGVhcl9zdGF0ZV9vYmopCj4+PiAtICAgICAgICByZXR1cm47Cj4+PiAtCj4+PiAtICAgIHIg
PSBhbWRncHVfYm9fcmVzZXJ2ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaiwgdHJ1ZSk7
Cj4+PiAtICAgIGlmIChsaWtlbHkociA9PSAwKSkgewo+Pj4gLSAgICAgICAgYW1kZ3B1X2JvX3Vu
cGluKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsKPj4+IC0gICAgICAgIGFtZGdwdV9i
b191bnJlc2VydmUoYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOwo+Pj4gLSAgICB9Cj4+
PiAtfQo+Pj4gLQo+Pj4gc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX21lY19maW5pKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KSB7Cj4+PiAgICAgIGFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+
Z2Z4Lm1lYy5ocGRfZW9wX29iaiwgTlVMTCwgTlVMTCk7IEBACj4+PiAtMzc4MCwxMCArMzc0Nyw2
IEBAIHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX2h3X2luaXQodm9pZCAqaGFuZGxlKQo+Pj4gICAgICBp
bnQgcjsKPj4+ICAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKiloYW5kbGU7Cj4+Pgo+Pj4gLSAgICByID0gZ2Z4X3YxMF8wX2NzYl92cmFtX3Bp
bihhZGV2KTsKPj4+IC0gICAgaWYgKHIpCj4+PiAtICAgICAgICByZXR1cm4gcjsKPj4+IC0KPj4+
ICAgICAgaWYgKCFhbWRncHVfZW11X21vZGUpCj4+PiAgICAgICAgICBnZnhfdjEwXzBfaW5pdF9n
b2xkZW5fcmVnaXN0ZXJzKGFkZXYpOwo+Pj4KPj4+IEBAIC0zODcxLDcgKzM4MzQsNiBAQCBzdGF0
aWMgaW50IGdmeF92MTBfMF9od19maW5pKHZvaWQgKmhhbmRsZSkKPj4+ICAgICAgfQo+Pj4gICAg
ICBnZnhfdjEwXzBfY3BfZW5hYmxlKGFkZXYsIGZhbHNlKTsKPj4+ICAgICAgZ2Z4X3YxMF8wX2Vu
YWJsZV9ndWlfaWRsZV9pbnRlcnJ1cHQoYWRldiwgZmFsc2UpOwo+Pj4gLSAgICBnZnhfdjEwXzBf
Y3NiX3ZyYW1fdW5waW4oYWRldik7Cj4+Pgo+Pj4gICAgICByZXR1cm4gMDsKPj4+IH0KPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCj4+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKPj4+IGluZGV4IDRjYzJlNTAuLjUy
NGE3YmEgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
MC5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCj4+PiBA
QCAtMTY4MywzOSArMTY4Myw2IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfcmxjX2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+PiAgICAgIHJldHVybiAwOwo+Pj4gfQo+Pj4KPj4+IC1z
dGF0aWMgaW50IGdmeF92OV8wX2NzYl92cmFtX3BpbihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikgLXsKPj4+IC0gICAgaW50IHI7Cj4+PiAtCj4+PiAtICAgIHIgPSBhbWRncHVfYm9fcmVzZXJ2
ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaiwgZmFsc2UpOwo+Pj4gLSAgICBpZiAodW5s
aWtlbHkociAhPSAwKSkKPj4+IC0gICAgICAgIHJldHVybiByOwo+Pj4gLQo+Pj4gLSAgICByID0g
YW1kZ3B1X2JvX3BpbihhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaiwKPj4+IC0gICAgICAg
ICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNKTsKPj4+IC0gICAgaWYgKCFyKQo+Pj4gLSAgICAg
ICAgYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9ncHVfYWRkciA9Cj4+PiAtICAgICAgICAgICAg
YW1kZ3B1X2JvX2dwdV9vZmZzZXQoYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOwo+Pj4g
LQo+Pj4gLSAgICBhbWRncHVfYm9fdW5yZXNlcnZlKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVf
b2JqKTsKPj4+IC0KPj4+IC0gICAgcmV0dXJuIHI7Cj4+PiAtfQo+Pj4gLQo+Pj4gLXN0YXRpYyB2
b2lkIGdmeF92OV8wX2NzYl92cmFtX3VucGluKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSAt
ewo+Pj4gLSAgICBpbnQgcjsKPj4+IC0KPj4+IC0gICAgaWYgKCFhZGV2LT5nZngucmxjLmNsZWFy
X3N0YXRlX29iaikKPj4+IC0gICAgICAgIHJldHVybjsKPj4+IC0KPj4+IC0gICAgciA9IGFtZGdw
dV9ib19yZXNlcnZlKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqLCB0cnVlKTsKPj4+IC0g
ICAgaWYgKGxpa2VseShyID09IDApKSB7Cj4+PiAtICAgICAgICBhbWRncHVfYm9fdW5waW4oYWRl
di0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOwo+Pj4gLSAgICAgICAgYW1kZ3B1X2JvX3VucmVz
ZXJ2ZShhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaik7Cj4+PiAtICAgIH0KPj4+IC19Cj4+
PiAtCj4+PiBzdGF0aWMgdm9pZCBnZnhfdjlfMF9tZWNfZmluaShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikgewo+Pj4gICAgICBhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPmdmeC5tZWMu
aHBkX2VvcF9vYmosIE5VTEwsIE5VTEwpOyBAQAo+Pj4gLTM2OTQsMTAgKzM2NjEsNiBAQCBzdGF0
aWMgaW50IGdmeF92OV8wX2h3X2luaXQodm9pZCAqaGFuZGxlKQo+Pj4KPj4+ICAgICAgZ2Z4X3Y5
XzBfY29uc3RhbnRzX2luaXQoYWRldik7Cj4+Pgo+Pj4gLSAgICByID0gZ2Z4X3Y5XzBfY3NiX3Zy
YW1fcGluKGFkZXYpOwo+Pj4gLSAgICBpZiAocikKPj4+IC0gICAgICAgIHJldHVybiByOwo+Pj4g
LQo+Pj4gICAgICByID0gYWRldi0+Z2Z4LnJsYy5mdW5jcy0+cmVzdW1lKGFkZXYpOwo+Pj4gICAg
ICBpZiAocikKPj4+ICAgICAgICAgIHJldHVybiByOwo+Pj4gQEAgLTM3NzksOCArMzc0Miw2IEBA
IHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfaHdfZmluaSh2b2lkICpoYW5kbGUpCj4+PiAgICAgIGdmeF92
OV8wX2NwX2VuYWJsZShhZGV2LCBmYWxzZSk7Cj4+PiAgICAgIGFkZXYtPmdmeC5ybGMuZnVuY3Mt
PnN0b3AoYWRldik7Cj4+Pgo+Pj4gLSAgICBnZnhfdjlfMF9jc2JfdnJhbV91bnBpbihhZGV2KTsK
Pj4+IC0KPj4+ICAgICAgcmV0dXJuIDA7Cj4+PiB9Cj4+Pgo+Pj4gLS0KPj4+IDIuNy40Cj4+Pgo+
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGFt
ZC1nZnggbWFpbGluZyBsaXN0Cj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4g
aHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBz
JTNBJTJGJTJGbGlzCj4+PiB0Cj4+PiBzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0
aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDIlN0MwMSU3Q1gKPj4+IGkKPj4+IGFvamllLll1YW4l
NDBhbWQuY29tJTdDNjVlMTYyZTUwOWVhNGE5MGY3OTMwOGQ3NzI2NmRlNjUlN0MzZGQ4OTYxZmU0
OAo+Pj4gOAo+Pj4gNGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzEwMzY1ODQ2NDUx
Mjc1MSZhbXA7c2RhdGE9cjVmcGlkNUlzCj4+PiBQCj4+PiA4YW56ZyUyRlpJWUhuME44eGNlQnZH
N3J0Ukc4MCUyQjc4NjhvJTNEJmFtcDtyZXNlcnZlZD0wCj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnBy
b3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3QKPj4gcy5mcmVlZGVz
a3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTAyJTdDMDEl
N0NNbwo+PiBuay5MaXUlNDBhbWQuY29tJTdDY2FkZWYwMWI4NGFiNDVmOTBmMTkwOGQ3NzNmOTMy
Y2MlN0MzZGQ4OTYxZmU0ODg0ZTYwCj4+IDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzEw
NTM4NjQ1NjI5OTY4MCZhbXA7c2RhdGE9aFlzdk50elViJTJCVGIKPj4gaUFOS0F4Mng5ZG1ZVzFp
a0M2NnIlMkI2SGJrMzI0NFBFJTNEJmFtcDtyZXNlcnZlZD0wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
