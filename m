Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE846109D62
	for <lists+amd-gfx@lfdr.de>; Tue, 26 Nov 2019 12:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5238A6E098;
	Tue, 26 Nov 2019 11:58:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690045.outbound.protection.outlook.com [40.107.69.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CE06E098
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 Nov 2019 11:58:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofGV07uc6njb4kPqoA0iMspROV7iA9E8vY8p9rE5GR4srPaltbefMpc7FfuGweWmwQ6qdlW32slxac2EbY2Di4rsk0qjpL1dp6MI4vHPkEzbxaHfhZ+R9IAuZaNrXzmEnQSl/WhvL0y0QJxo3eyQKEqAYS7vWuTgdMDGC9EHS4byfudyjaUu3ool/0gAs6w5rp06m65jsiZomvv8wCdIjHA/hVz78aSE+9hsfwsYkP3qBS2mxtmokbx/WSIYnH2edW/xkkGoMr++PSuTyvMFSIb9a3bMaizLKJ03xs18/yJyzHmJn4r4lM/osm9HLvFqf1M7tLD/8Isuz2AZtZfjbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0264VXCHTMYhqjgT8vg9ut5tGBIoIHq0V2gzcmfZUh4=;
 b=LdfTJwhk0PMlEkEke1YW2FbAmJoKthgFc5z2ArFdddrOqupkOTQRyXfIuB0pCNJf0wuTIBZ2yTLdEU56Uow9KlRpDNfJtEbfUn4fb7OrcyNLYyL4W0sJOabCXTIxMbn+t129hXwAtf90MlS2uvvU8nXc3IU8hcvrwOxq/9A0/pd/6pZS2MY2ip2AjqM/f3NdROaVgq3uLNTiBJrYAuLXYMvQmhmAcsZkLprg/J2wnLIf/iwnPUVjpXNEZdL6zMWdiNKGxKg2uZTK2aNvrmQlYsCRftGS5y+ARQY0EZMYcWM3Fo7bVHm0NoN7lme9EKjw4Bxvo1vQwYuSxVTkNMOl/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Tue, 26 Nov 2019 11:58:05 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 11:58:04 +0000
Subject: Re: [PATCH] drm/amdgpu: implement TMZ accessor (v2)
To: Luben Tuikov <luben.tuikov@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <b64da3b9-9f20-549d-27f2-18da3ce10ea4@gmail.com>
 <20191121013308.50489-1-luben.tuikov@amd.com>
 <MN2PR12MB3838AAD51A07CB1016AE6B3CF04E0@MN2PR12MB3838.namprd12.prod.outlook.com>
 <007cb42e-2b6c-0da2-87a7-24692e84eef1@amd.com>
 <1584abb5-fa8e-b9dc-f4a2-49b95faff2e2@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <767550e6-243b-a228-1532-037ec7f439b4@amd.com>
Date: Tue, 26 Nov 2019 12:57:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <1584abb5-fa8e-b9dc-f4a2-49b95faff2e2@amd.com>
Content-Language: en-US
X-ClientProxiedBy: BN6PR11CA0020.namprd11.prod.outlook.com
 (2603:10b6:405:2::30) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d667ee16-14c3-491f-e9e5-08d77267e4f5
X-MS-TrafficTypeDiagnostic: DM5PR12MB2535:|DM5PR12MB2535:
X-MS-Exchange-PUrlCount: 1
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB25351AD9B9F87BFA02A17FA483450@DM5PR12MB2535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0233768B38
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(199004)(189003)(13464003)(47776003)(966005)(14454004)(25786009)(2870700001)(6116002)(6436002)(11346002)(76176011)(52116002)(2486003)(65806001)(186003)(66476007)(66574012)(6306002)(478600001)(46003)(6512007)(23676004)(66946007)(446003)(5660300002)(386003)(53546011)(2616005)(6506007)(2906002)(30864003)(65956001)(31686004)(14444005)(8936002)(6666004)(316002)(99286004)(58126008)(110136005)(7736002)(305945005)(66556008)(6246003)(4326008)(229853002)(6486002)(4001150100001)(86362001)(50466002)(2501003)(31696002)(81166006)(81156014)(8676002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2535;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jORiPuoEx2sjI9EasKnqcQxoQfkyXCXobHw+sCr3zaWb+oKnQeT3YO/ni9f9OLnfNCg/xNvBxbCVfKJParr+mpmRt4JLi0BTxUHESW5P77KvmbfIfzgfHCNIVFQChCEeb2jL2vE+Ok9ksaVvg82PoqTsbMkpmK+PX2azjYeZn2KhtAqaf6HueuQfTApo/tOkRNeXNdzvCxb4OgvB4yaJo4repG69GU7kkhHnKRV9ZsZTu+HsrLSm4+h5WNOtdDA8Llq0kQTTHyEC75FsCfZ7iLjWE+kvOK/q35JW8N95mtjlbRbto2C9pPGwuwf5fO0c+W1RYRQaIfk+FteQSBwU33iITM4lR0YhoOnJpT8Jo2Fuq7V2somc/RwcY53dZpwsZY2znzXHAFEsac0ovEdEgZEa+SnOPLrKKO+yfhGhLYQjcb3wr3Eb++nV4uGKf1sD6kJQ0qkoX3hv8AhWxXqvmHndexzTNlyOncu9CrD4aA4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d667ee16-14c3-491f-e9e5-08d77267e4f5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 11:58:04.8572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsBk8cj6hp+VvtaacrGW2e/O5xwddeLEMO+CylzHij2zV0cwqGkjctr6+gTPut8Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2535
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0264VXCHTMYhqjgT8vg9ut5tGBIoIHq0V2gzcmfZUh4=;
 b=qjN5kq0TF4vQWhIjnYyc5tAS8HgozjLj1K8CvTg00Qhgp6bpR1U8fOmMafKYVTtihw/3CaLARDKhuNU4fU9/cd6zo1DqXYWpXDpMTdR3ZiavVNNDk9hM4gYLWEKRodEtcwLjQ6q/sR9q94DaXRARqSfQnbWXuM4Kixm5hPNP91U=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjEuMTEuMTkgdW0gMDQ6Mzkgc2NocmllYiBMdWJlbiBUdWlrb3Y6Cj4gT24gMjAxOS0xMS0y
MCAxMDoyMSBwLm0uLCBMdWJlbiBUdWlrb3Ygd3JvdGU6Cj4+IE9uIDIwMTktMTEtMjAgMTA6MDIg
cC5tLiwgTGl1LCBBYXJvbiB3cm90ZToKPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+
Pj4+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+
IE9uIEJlaGFsZiBPZgo+Pj4+IEx1YmVuIFR1aWtvdgo+Pj4+IFNlbnQ6IFRodXJzZGF5LCBOb3Zl
bWJlciAyMSwgMjAxOSA5OjMzIEFNCj4+Pj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4+Pj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNv
bT47IFR1aWtvdiwgTHViZW4KPj4+PiA8THViZW4uVHVpa292QGFtZC5jb20+OyBLb2VuaWcsIENo
cmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPgo+Pj4+IFN1YmplY3Q6IFtQQVRDSF0g
ZHJtL2FtZGdwdTogaW1wbGVtZW50IFRNWiBhY2Nlc3NvciAodjIpCj4+Pj4KPj4+PiBJbXBsZW1l
bnQgYW4gYWNjZXNzb3Igb2YgYWRldi0+dG16LmVuYWJsZWQuIExldCBub3QgY29kZSBhcm91bmQg
YWNjZXNzIGl0Cj4+Pj4gYXMgImlmIChhZGV2LT50bXouZW5hYmxlZCkiCj4+Pj4gYXMgdGhlIG9y
Z2FuaXphdGlvbiBtYXkgY2hhbmdlLiBJbnN0ZWFkLi4uCj4+Pj4KPj4+PiBSZWNydWl0ICJib29s
IGFtZGdwdV9pc190bXooYWRldikiIHRvIHJldHVybiBleGFjdGx5IHRoaXMgQm9vbGVhbiB2YWx1
ZS4KPj4+PiBUaGF0IGlzLCB0aGlzIGZ1bmN0aW9uIGlzIG5vdyBhbiBhY2Nlc3NvciBvZiBhbiBh
bHJlYWR5IGluaXRpYWxpemVkIGFuZCBzZXQgYWRldgo+Pj4+IGFuZCBhZGV2LT50bXouCj4+Pj4K
Pj4+PiBBZGQgInZvaWQgYW1kZ3B1X3Rtel9zZXQoYWRldikiIHRvIGNoZWNrIGFuZCBzZXQKPj4+
PiBhZGV2LT50bXouKiBhdCBpbml0aWFsaXphdGlvbiB0aW1lLiBBZnRlciB3aGljaAo+Pj4+IG9u
ZSB1c2VzICJib29sIGFtZGdwdV9pc190bXooYWRldikiIHRvIHF1ZXJ5IHdoZXRoZXIgYWRldiBz
dXBwb3J0cyBUTVouCj4+Pj4KPj4+PiBBbHNvLCByZW1vdmUgY2lyY3VsYXIgaGVhZGVyIGZpbGUg
aW5jbHVkZS4KPj4+Pgo+Pj4+IHYyOiBSZW1vdmUgYW1kZ3B1X3Rtei5bY2hdIGFzIHJlcXVlc3Rl
ZC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFt
ZC5jb20+Cj4+Pj4gLS0tCj4+Pj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmls
ZSAgICAgICAgfCAgMiArLQo+Pj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
LmggICAgICAgIHwgIDYgKystCj4+Pj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMgfCAgMyArLQo+Pj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dtYy5jICAgIHwgMjMgKysrKysrKysrKwo+Pj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2dtYy5oICAgIHwgIDkgKysrKwo+Pj4+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Rtei5jICAgIHwgNTIgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Rtei5oICAgIHwgMzkgLS0tLS0t
LS0tLS0tLS0tLQo+Pj4+ICAgNyBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCA5NSBk
ZWxldGlvbnMoLSkgIGRlbGV0ZSBtb2RlIDEwMDY0NAo+Pj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90bXouYwo+Pj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90bXouaAo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9NYWtlZmlsZQo+Pj4+IGluZGV4IDgzZWUxYzY3NmUzYS4uN2FlM2IyMmM1NjI4IDEw
MDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlCj4+Pj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUKPj4+PiBAQCAtNTUsNyAr
NTUsNyBAQCBhbWRncHUteSArPSBhbWRncHVfZGV2aWNlLm8gYW1kZ3B1X2ttcy5vIFwKPj4+PiAg
IAlhbWRncHVfdmZfZXJyb3IubyBhbWRncHVfc2NoZWQubyBhbWRncHVfZGVidWdmcy5vCj4+Pj4g
YW1kZ3B1X2lkcy5vIFwKPj4+PiAgIAlhbWRncHVfZ21jLm8gYW1kZ3B1X21taHViLm8gYW1kZ3B1
X3hnbWkubyBhbWRncHVfY3NhLm8KPj4+PiBhbWRncHVfcmFzLm8gYW1kZ3B1X3ZtX2NwdS5vIFwK
Pj4+PiAgIAlhbWRncHVfdm1fc2RtYS5vIGFtZGdwdV9kaXNjb3ZlcnkubyBhbWRncHVfcmFzX2Vl
cHJvbS5vCj4+Pj4gYW1kZ3B1X25iaW8ubyBcCj4+Pj4gLQlhbWRncHVfdW1jLm8gc211X3YxMV8w
X2kyYy5vIGFtZGdwdV90bXoubwo+Pj4+ICsJYW1kZ3B1X3VtYy5vIHNtdV92MTFfMF9pMmMubwo+
Pj4+Cj4+Pj4gICBhbWRncHUtJChDT05GSUdfUEVSRl9FVkVOVFMpICs9IGFtZGdwdV9wbXUubwo+
Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5o
Cj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+Pj4+IGluZGV4IGQx
MjBmZTU4ZWJlYS4uODA1ZTEyZWYxM2VhIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1LmgKPj4+PiBAQCAtOTAsNyArOTAsNiBAQAo+Pj4+ICAgI2luY2x1ZGUgImFtZGdw
dV9tZXMuaCIKPj4+PiAgICNpbmNsdWRlICJhbWRncHVfdW1jLmgiCj4+Pj4gICAjaW5jbHVkZSAi
YW1kZ3B1X21taHViLmgiCj4+Pj4gLSNpbmNsdWRlICJhbWRncHVfdG16LmgiCj4+Pj4KPj4+PiAg
ICNkZWZpbmUgTUFYX0dQVV9JTlNUQU5DRQkJMTYKPj4+Pgo+Pj4+IEBAIC0xMjY2LDUgKzEyNjUs
MTAgQEAgX25hbWUjI19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKPj4+PiAJCQlcCj4+Pj4gICAJ
CQkJCQkJCQlcCj4+Pj4gICBzdGF0aWMgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgcG11X2F0dHJf
IyNfbmFtZSA9IF9fQVRUUl9STyhfbmFtZSkKPj4+Pgo+Pj4+ICtzdGF0aWMgaW5saW5lIGJvb2wg
YW1kZ3B1X2lzX3RteihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgewo+Pj4+ICsgICAgICAg
cmV0dXJuIGFkZXYtPnRtei5lbmFibGVkOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICAgI2VuZGlmCj4+
Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMK
Pj4+PiBpbmRleCBiMTQwOGM1ZTQ2NDAuLjU2ODM2MDU0ZTZhOCAxMDA2NDQKPj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPj4+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPj4+PiBAQCAtNjQsNyArNjQs
NiBAQAo+Pj4+ICAgI2luY2x1ZGUgImFtZGdwdV94Z21pLmgiCj4+Pj4gICAjaW5jbHVkZSAiYW1k
Z3B1X3Jhcy5oIgo+Pj4+ICAgI2luY2x1ZGUgImFtZGdwdV9wbXUuaCIKPj4+PiAtI2luY2x1ZGUg
ImFtZGdwdV90bXouaCIKPj4+Pgo+Pj4+ICAgI2luY2x1ZGUgPGxpbnV4L3N1c3BlbmQuaD4KPj4+
Pgo+Pj4+IEBAIC0xMDczLDcgKzEwNzIsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfY2hl
Y2tfYXJndW1lbnRzKHN0cnVjdAo+Pj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+Pj4KPj4+PiAg
IAlhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPSBhbWRncHVfdWNvZGVfZ2V0X2xvYWRfdHlwZShh
ZGV2LAo+Pj4+IGFtZGdwdV9md19sb2FkX3R5cGUpOwo+Pj4+Cj4+Pj4gLQlhZGV2LT50bXouZW5h
YmxlZCA9IGFtZGdwdV9pc190bXooYWRldik7Cj4+Pj4gKwlhbWRncHVfdG16X3NldChhZGV2KTsK
Pj4+Pgo+Pj4+ICAgCXJldHVybiByZXQ7Cj4+Pj4gICB9Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuYwo+Pj4+IGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5jCj4+Pj4gaW5kZXggYTEyZjMzYzBmNWRmLi5hMDI0NWQ4
YjJmMzcgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dtYy5jCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5j
Cj4+Pj4gQEAgLTMzMywzICszMzMsMjYgQEAgdm9pZCBhbWRncHVfZ21jX3Jhc19maW5pKHN0cnVj
dCBhbWRncHVfZGV2aWNlCj4+Pj4gKmFkZXYpCj4+Pj4gICAJYW1kZ3B1X21taHViX3Jhc19maW5p
KGFkZXYpOwo+Pj4+ICAgCWFtZGdwdV94Z21pX3Jhc19maW5pKGFkZXYpOwo+Pj4+ICAgfQo+Pj4+
ICsKPj4+PiArLyoqCj4+Pj4gKyAqIGFtZGdwdV90bXpfc2V0IC0tIGNoZWNrIGFuZCBzZXQgaWYg
YSBkZXZpY2Ugc3VwcG9ydHMgVE1aCj4+Pj4gKyAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50
ZXIKPj4+PiArICoKPj4+PiArICogQ2hlY2sgYW5kIHNldCBpZiBhbiB0aGUgZGV2aWNlIEBhZGV2
IHN1cHBvcnRzIFRydXN0ZWQgTWVtb3J5Cj4+Pj4gKyAqIFpvbmVzIChUTVopLgo+Pj4+ICsgKi8K
Pj4+PiArdm9pZCBhbWRncHVfdG16X3NldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgewo+
Pj4+ICsJaWYgKCFhbWRncHVfdG16KQo+Pj4+ICsJCXJldHVybjsKPj4+PiArCj4+Pj4gKwlpZiAo
YWRldi0+YXNpY190eXBlIDwgQ0hJUF9SQVZFTiB8fAo+Pj4+ICsJICAgIGFkZXYtPmFzaWNfdHlw
ZSA9PSBDSElQX0FSQ1RVUlVTKSB7Cj4+Pj4gKwkJZGV2X3dhcm4oYWRldi0+ZGV2LCAiVHJ1c3Rl
ZCBNZW1vcnkgWm9uZSAoVE1aKSBmZWF0dXJlCj4+Pj4gbm90IHN1cHBvcnRlZFxuIik7Cj4+Pj4g
KwkJcmV0dXJuOwo+Pj4+ICsJfQo+Pj4+ICsKPj4+PiArCWFkZXYtPnRtei5lbmFibGVkID0gdHJ1
ZTsKPj4+PiArCj4+Pj4gKwlkZXZfaW5mbyhhZGV2LT5kZXYsICJUcnVzdGVkIE1lbW9yeSBab25l
IChUTVopIGZlYXR1cmUKPj4+PiBzdXBwb3J0ZWQgYW5kCj4+Pj4gK2VuYWJsZWRcbiIpOyB9Cj4+
PiBIaSBMdWJlbiwKPj4+IFRNWiBpcyBqdXN0IGEgc3BlY2lmaWMgZmVhdHVyZSBhbmQgSSB0aGlu
ayB0aGlzIGlzIGEgbmljZSBjaGFuZ2UgdGhhdCBtb3ZpbmcgYW1kZ3B1X3RteiB0byBhbWRncHVf
Z21jLmguCj4+PiBBbm90aGVyIHRoaW5nLCB5b3UgY2FuIHJlbmFtZSBhbWRncHVfdG16X3NldCB0
byBhbWRncHVfZ21jX3Rtel9zZXQgaW4gYW1kZ3B1X2dtYy5oLyBhbWRncHVfZ21jLmMKPj4+IElu
IGFtZGdwdV9nbWMuYywgYWxsIGZ1bmN0aW9ucyBhcmUgcHJlZml4ZWQgd2l0aCBhbWRncHVfZ21j
XyouCj4+IFllcywgSSB1bmRlcnN0YW5kIHRoaXMgR01DIG5hbWluZy4gSGVyZSdzIHRoZSByZWFz
b25pbmc6Cj4+Cj4+IDEuIEkgdHJpZWQgdG8ga2VlcCB0aGUgc2FtZSBuYW1lIGFzIHdhcyBhbHJl
YWR5IGluIHRoZSBjb2RlIGJlZm9yZSB0aGlzIHBhdGNoLAo+PiAgICAgYW1kZ3B1X3Rtel8vdmVy
Yi8oKS4KPj4KPj4gMi4gSSBmZWVsIHRoYXQgVE1aLCB3aGlsZSBhIGZ1bmN0aW9uIF9vZl8gdGhl
IEdNQyBhbmQgQ3J5cHRvLCBpc24ndCBuZWNlc3NhcmlseQo+PiAgICAgZGlyZWN0bHkgZHJpdmlu
Zy9wcm9ncmFtbWluZy9ldGMgdGhlIEdNQyBfaGFyZHdhcmUgYmxvY2tfLCBqdXN0IGluZGlyZWN0
bHksCj4+ICAgICB2aWEgZmxhZ3MgcHJlc2VudCBpbiBQVEVzLCBhcmd1bWVudHMgdG8gcmVnaXN0
ZXJzLCBldGMuLCBpLmUuIGFzIGluIGlucHV0LAo+PiAgICAgYW5kIG5vdCBuZWNlc3NhcmlseSBi
ZWluZyBwYXJ0IG9mIHRoZSBHTUMgX2RyaXZlcl8gY29kZS4KPj4KPj4gMy4gTmFtZXMgY291bGQg
YmVjb21lIHRvbyBsb25nLCB2ZXJ5IHZlcnkgbG9uZywgYnkgc3RyaW5naW5nIGFsb25nCj4+ICAg
ICB0aHJlZS1sZXR0ZXIgYWNyb255bXMuIFdoaWxlIHRoZSBmdW5jdGlvbiBpcyBpbmRlZWQgaW4g
YW1kZ3B1X2dtYy5jLCBpdCBpcwo+PiAgICAgVE1aLWZlYXR1cmUgcmVsYXRlZCwgaW5kaXJlY3Rs
eSwgc28gSSBiZWxpdmUga2VlcGluZyB0aGUgc2FtZSBuYW1lIGFzIGl0IGhhZCBiZWZvcmUsCj4+
ICAgICB0byBiZSBjb3JyZWN0IGFuZCBzdWNjaW5jdCBlbm91Z2ggdG8gYmUgZGVzY3JpcHRpdmUu
Cj4+Cj4+IEFzIENocmlzdGlhbiBoYXMgcG9pbnRlZCBvdXQgc2V2ZXJhbCB0aW1lcyAiSXQncyBh
IGZlYXR1cmUsIG5vdCBhbiBJUCBibG9jayIsCj4+IHdoaWNoIHdhcyB0aGUgcmVhc29uIGhlJ2Qg
YmVlbiB3YW50aW5nIHRvIHJlbW92ZSBhbWRncHVfdG16LltjaF0uIEl0IGVuZGVkIHVwCj4+IGlu
IGFtZGdwdV9nbWMsIGFzIGl0IHNlZW1lZCB0byBiZSB0aGUgY2xvc2VzdCBwbGFjZSB0byBwdXQg
aXQuCj4gQW5vdGhlciBwb2ludCB3aGljaCBJIGZvcmdvdCB0byBhZGQgaXM6Cj4KPiBVc2FnZS4g
SG93IHdpbGwgdGhpcyBiZSB1c2VkIGFuZCB3aGF0IGRvZXMgaXQgX21lYW5fPwo+Cj4gYW1kZ3B1
X3Rtel9zZXQoYWRldik7Cj4KPiBWUy4KPgo+IGFtZGdwdV9nbWNfdG16X3NldChhZGV2KTsKPgo+
IEFyZSB3ZSByZWFsbHkgc2V0dGluZyBhbnl0aGluZyBpbiB0aGUgR01DIElQIGJsb2NrPwoKQWN0
dWFsbHkgeWVzLCBidXQgb25seSBpbmRpcmVjdGx5LgoKV2Ugc2V0IHdoYXQgZmxhZ3MgYXJlIGlu
c2VydGVkIGludG8gdGhlIFBURXMgd2hpY2ggYXJlIHRoZW4gZXNzZW50aWFsbHkgCnByb2Nlc3Nl
ZCBieSB0aGUgR01DLgoKPgo+IFdlJ3JlIG9ubHkgYXNraW5nIHRoYXQgdGhlIGRldmljZSBiZSBr
bm93biBhcyBhIGRldmljZSB3aGljaAo+IHN1cHBvcnRzIGFuZCBtYXkgcmVjZWl2ZSBUTVogQk9z
LiBJdCdzIGFuIGFic3RyYWN0aW9uIChUTVopIG92ZXIgYQo+IGRldmljZSBhYnN0cmFjdGlvbiAo
c3RydWN0IGFtZGdwdV9kZXZpY2UpLgo+Cj4gU2ltaWxhciBhcmd1bWVudCBhcHBsaWVzIHRvIHRo
ZSBzdGF0aWMgaW5saW5lCj4KPiBhbWRncHVfaXNfdG16KGFkZXYpOwo+Cj4gVlMKPgo+IGFtZGdw
dV9nbWNfaXNfdG16KGFkZXYpOwo+Cj4gQXJlIHdlIGFza2luZyBhYm91dCB0aGUgc3RhdGUgb2Yg
dGhlIEdNQyBibG9jaywgb3IgYXJlCj4gd2UgYXNraW5nIGFib3V0IHRoZSBmZWF0dXJlIHN1cHBv
cnQgaW4gdGhlIGFtZGdwdSBkZXZpY2UKPiBhYnN0cmFjdGlvbj8KCkkgd291bGQgbmFtZSB0aGF0
IGFtZGdwdV9nbWNfaXNfdG16X2VuYWJsZWQoKSwgYnV0IHRoYXQgaXMgbm90IGEgaGFyZCAKcmVx
dWlyZW1lbnQuCgo+IEkgYmVsaWV2ZSB3ZSBzaG91bGQga2VlcCB0aGUgbmFtZXMgYXMgdGhleSBo
YWQgYmVlbiBiZWZvcmUKPiB0aGlzIHBhdGNoLiBUaGlzIHBhdGNoIG9ubHkgbW92ZXMgdGhlbSBh
cm91bmQuCgpJdCdzIGp1c3QgdGhlIG5hbWluZywgZmVlbCBmcmVlIHRvIGFkZCBhIEFja2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIAo8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiBhbnl3YXkuCgpS
ZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gUmVnYXJkcywKPiBMdWJlbgo+Cj4+IFJlZ2FyZHMsCj4+
IEx1YmVuCj4+Cj4+PiBXaXRoIHRoaXMgZml4ZWQsIFJldmlld2VkLWJ5OiBBYXJvbiBMaXUgPGFh
cm9uLmxpdUBhbWQuY29tPgo+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dtYy5oCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZ21jLmgKPj4+PiBpbmRleCA0MDY3MzZhMWJkM2QuLjFhYmQ5MzVhMDczZSAxMDA2NDQK
Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgKPj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgKPj4+PiBAQCAtMjY3
LDQgKzI2NywxMyBAQCBib29sIGFtZGdwdV9nbWNfZmlsdGVyX2ZhdWx0cyhzdHJ1Y3QKPj4+PiBh
bWRncHVfZGV2aWNlICphZGV2LCB1aW50NjRfdCBhZGRyLCAgaW50IGFtZGdwdV9nbWNfcmFzX2xh
dGVfaW5pdChzdHJ1Y3QKPj4+PiBhbWRncHVfZGV2aWNlICphZGV2KTsgIHZvaWQgYW1kZ3B1X2dt
Y19yYXNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZQo+Pj4+ICphZGV2KTsKPj4+Pgo+Pj4+ICsv
Kgo+Pj4+ICsgKiBUcnVzdGVkIE1lbW9yeSBab25lIHBhcnRpY3VsYXJzCj4+Pj4gKyAqLwo+Pj4+
ICtzdHJ1Y3QgYW1kZ3B1X3RteiB7Cj4+Pj4gKwlib29sCWVuYWJsZWQ7Cj4+Pj4gK307Cj4+Pj4g
Kwo+Pj4+ICtleHRlcm4gdm9pZCBhbWRncHVfdG16X3NldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldik7Cj4+Pj4gKwo+Pj4+ICAgI2VuZGlmCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90bXouYwo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Rtei5jCj4+Pj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4gaW5k
ZXggODIzNTI3YTBmYTQ3Li4wMDAwMDAwMDAwMDAKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdG16LmMKPj4+PiArKysgL2Rldi9udWxsCj4+Pj4gQEAgLTEsNTIg
KzAsMCBAQAo+Pj4+IC0vKgo+Pj4+IC0gKiBDb3B5cmlnaHQgMjAxOSBBZHZhbmNlZCBNaWNybyBE
ZXZpY2VzLCBJbmMuCj4+Pj4gLSAqCj4+Pj4gLSAqIFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50
ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBhCj4+Pj4gLSAqIGNv
cHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0
aGUgIlNvZnR3YXJlIiksCj4+Pj4gLSAqIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQg
cmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24KPj4+PiAtICogdGhlIHJp
Z2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1
YmxpY2Vuc2UsCj4+Pj4gLSAqIGFuZC9vciBzZWxsIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFu
ZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZQo+Pj4+IC0gKiBTb2Z0d2FyZSBpcyBmdXJu
aXNoZWQgdG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgo+Pj4+
IC0gKgo+Pj4+IC0gKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNz
aW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbgo+Pj4+IC0gKiBhbGwgY29waWVzIG9yIHN1
YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4KPj4+PiAtICoKPj4+PiAtICogVEhF
IFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJ
TkQsCj4+Pj4gRVhQUkVTUyBPUgo+Pj4+IC0gKiBJTVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBM
SU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GCj4+Pj4gTUVSQ0hBTlRBQklMSVRZLAo+Pj4+IC0g
KiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiAg
SU4gTk8KPj4+PiBFVkVOVCBTSEFMTAo+Pj4+IC0gKiBUSEUgQ09QWVJJR0hUIEhPTERFUihTKSBP
UiBBVVRIT1IoUykgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sCj4+Pj4gREFNQUdFUyBPUgo+Pj4+
IC0gKiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBU
T1JUIE9SCj4+Pj4gT1RIRVJXSVNFLAo+Pj4+IC0gKiBBUklTSU5HIEZST00sIE9VVCBPRiBPUiBJ
TiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SCj4+Pj4gVEhFIFVTRSBPUgo+Pj4+IC0g
KiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCj4+Pj4gLSAqLwo+Pj4+IC0KPj4+PiAt
I2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+Pj4+IC0KPj4+PiAtI2luY2x1ZGUgPGRybS9hbWRf
YXNpY190eXBlLmg+Cj4+Pj4gLQo+Pj4+IC0jaW5jbHVkZSAiYW1kZ3B1LmgiCj4+Pj4gLSNpbmNs
dWRlICJhbWRncHVfdG16LmgiCj4+Pj4gLQo+Pj4+IC0KPj4+PiAtLyoqCj4+Pj4gLSAqIGFtZGdw
dV9pc190bXogLSB2YWxpZGF0ZSB0cnVzdCBtZW1vcnkgem9uZQo+Pj4+IC0gKgo+Pj4+IC0gKiBA
YWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4+Pj4gLSAqCj4+Pj4gLSAqIFJldHVybiB0cnVl
IGlmIEBkZXYgc3VwcG9ydHMgdHJ1c3RlZCBtZW1vcnkgem9uZXMgKFRNWiksIGFuZCByZXR1cm4K
Pj4+PiBmYWxzZSBpZgo+Pj4+IC0gKiBAZGV2IGRvZXMgbm90IHN1cHBvcnQgVE1aLgo+Pj4+IC0g
Ki8KPj4+PiAtYm9vbCBhbWRncHVfaXNfdG16KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSAt
ewo+Pj4+IC0JaWYgKCFhbWRncHVfdG16KQo+Pj4+IC0JCXJldHVybiBmYWxzZTsKPj4+PiAtCj4+
Pj4gLQlpZiAoYWRldi0+YXNpY190eXBlIDwgQ0hJUF9SQVZFTiB8fCBhZGV2LT5hc2ljX3R5cGUg
PT0KPj4+PiBDSElQX0FSQ1RVUlVTKSB7Cj4+Pj4gLQkJZGV2X3dhcm4oYWRldi0+ZGV2LCAiZG9l
c24ndCBzdXBwb3J0IHRydXN0ZWQgbWVtb3J5Cj4+Pj4gem9uZXMgKFRNWilcbiIpOwo+Pj4+IC0J
CXJldHVybiBmYWxzZTsKPj4+PiAtCX0KPj4+PiAtCj4+Pj4gLQlkZXZfaW5mbyhhZGV2LT5kZXYs
ICJUTVogZmVhdHVyZSBpcyBlbmFibGVkXG4iKTsKPj4+PiAtCj4+Pj4gLQlyZXR1cm4gdHJ1ZTsK
Pj4+PiAtfQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdG16LmgKPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90bXouaAo+
Pj4+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+IGluZGV4IDI4ZTA1MTc3ZmI4OS4uMDAw
MDAwMDAwMDAwCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Rt
ei5oCj4+Pj4gKysrIC9kZXYvbnVsbAo+Pj4+IEBAIC0xLDM5ICswLDAgQEAKPj4+PiAtLyoKPj4+
PiAtICogQ29weXJpZ2h0IDIwMTkgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgo+Pj4+IC0g
Kgo+Pj4+IC0gKiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwg
dG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYQo+Pj4+IC0gKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUg
YW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLAo+Pj4+
IC0gKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRp
bmcgd2l0aG91dCBsaW1pdGF0aW9uCj4+Pj4gLSAqIHRoZSByaWdodHMgdG8gdXNlLCBjb3B5LCBt
b2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLAo+Pj4+IC0gKiBh
bmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMg
dG8gd2hvbSB0aGUKPj4+PiAtICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJq
ZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKPj4+PiAtICoKPj4+PiAtICogVGhlIGFi
b3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwgYmUg
aW5jbHVkZWQgaW4KPj4+PiAtICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBv
ZiB0aGUgU29mdHdhcmUuCj4+Pj4gLSAqCj4+Pj4gLSAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURF
RCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELAo+Pj4+IEVYUFJFU1MgT1IK
Pj4+PiAtICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFO
VElFUyBPRgo+Pj4+IE1FUkNIQU5UQUJJTElUWSwKPj4+PiAtICogRklUTkVTUyBGT1IgQSBQQVJU
SUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElOIE5PCj4+Pj4gRVZFTlQgU0hB
TEwKPj4+PiAtICogVEhFIENPUFlSSUdIVCBIT0xERVIoUykgT1IgQVVUSE9SKFMpIEJFIExJQUJM
RSBGT1IgQU5ZIENMQUlNLAo+Pj4+IERBTUFHRVMgT1IKPj4+PiAtICogT1RIRVIgTElBQklMSVRZ
LCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUgo+Pj4+IE9USEVSV0lT
RSwKPj4+PiAtICogQVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRI
RSBTT0ZUV0FSRSBPUgo+Pj4+IFRIRSBVU0UgT1IKPj4+PiAtICogT1RIRVIgREVBTElOR1MgSU4g
VEhFIFNPRlRXQVJFLgo+Pj4+IC0gKgo+Pj4+IC0gKi8KPj4+PiAtCj4+Pj4gLSNpZm5kZWYgX19B
TURHUFVfVE1aX0hfXwo+Pj4+IC0jZGVmaW5lIF9fQU1ER1BVX1RNWl9IX18KPj4+PiAtCj4+Pj4g
LSNpbmNsdWRlICJhbWRncHUuaCIKPj4+PiAtCj4+Pj4gLS8qCj4+Pj4gLSAqIFRydXN0IG1lbW9y
eSB6b25lIHN0dWZmCj4+Pj4gLSAqLwo+Pj4+IC1zdHJ1Y3QgYW1kZ3B1X3RteiB7Cj4+Pj4gLQli
b29sCWVuYWJsZWQ7Cj4+Pj4gLX07Cj4+Pj4gLQo+Pj4+IC0KPj4+PiAtZXh0ZXJuIGJvb2wgYW1k
Z3B1X2lzX3RteihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Cj4+Pj4gLQo+Pj4+IC0jZW5k
aWYKPj4+PiAtLQo+Pj4+IDIuMjQuMC4xNTUuZ2Q5ZjZmM2I2MTkKPj4+Pgo+Pj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4gYW1kLWdmeCBtYWls
aW5nIGxpc3QKPj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
