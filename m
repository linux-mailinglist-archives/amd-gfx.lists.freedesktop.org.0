Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 904CD1558C7
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Feb 2020 14:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091DF6FC9F;
	Fri,  7 Feb 2020 13:52:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770057.outbound.protection.outlook.com [40.107.77.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F4C6FCA5
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Feb 2020 13:52:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDeAUTiwgCQP4KTwBAvWyohSTns7nQFL9xLQ49gr+22KI04PonaP5tieB6OgGBp9P53LEG7op6CRr+GW/sesgaLNtFseEMyd/J0+LnFpdHQwv0CTBRwGLsq+idRj9Ft+qTFpCDnzUJfpvrHBjauSmf/AwcJWOta36bjlVhNgTBPZUQg7MXTZpl7/GN50w7sde3wPeX7NgNuArGdLPYSYUdEgJ8ryxNCN5nAV97czFDYwMeuewnjZO1psBJVCN5YA3aVIVV3wf7tfk5GfrlAW7vHjfu/iztzqWGi57yHVDwVAKu2LzFLCrWZTm99vpwzxHryYF5uz+HoJ5PdmVhil3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VL+In9JTsrvDTMdRWOVxZVnbLCxMaYlpIC2MFDvVVcg=;
 b=ZLGHb3u/kAPNKhlMssfCSCedilTEmPhMV6+dHrjRWzrhClre/wWHtYnTotfrVyIvz3LOGlCigU3tpYqkVXDR1K+jdE4ncU6M6qMHUYq4NcdYqMcID9JhtrIC8U8Lz1BfMaAW4OroRE9TbXBqLZ7j+MP8PO0ZeDiEQZvLrKkIxgYtmeDaAh+Waq91Dh4pfbxwvi0nSyqo0XqsfPcLd2dmpqSsETrW3VPYnSyIy9uGkfVt/sVWeB5CpzSq063BPdUfWUAkcevoP3pB9s3BGGTPkDV3MDjOAw6x1c6hrIsId+87RwMmSZ3XR5snXqkw0Nby8pgdzphOGvMAwS+XsYj+Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VL+In9JTsrvDTMdRWOVxZVnbLCxMaYlpIC2MFDvVVcg=;
 b=LUXobieb0jhExYFxWUbanbTtpfDNO++6b8RwNJIErZ8Xe0kqfVSCbFSYk2QiM1WSD01bTCgV77R+lF/VbzNXaSKjoqUBYG4yidDXfoFc5FT2+dUXEuEk+gR+4LqQVbonS9wJEqXyIiV+OWSHF+QDC0sjKHxfqloiR2KM9oQEY4E=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1466.namprd12.prod.outlook.com (10.172.38.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Fri, 7 Feb 2020 13:52:53 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2707.024; Fri, 7 Feb 2020
 13:52:53 +0000
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1JGQyBQQVRDSCB2Ml0gZHJtL2FtZGdwdTogUmVt?=
 =?UTF-8?Q?ove_kfd_eviction_fence_before_release_bo?=
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <SN6PR12MB2800576A6BF1C9C25C4ABA12871C0@SN6PR12MB2800.namprd12.prod.outlook.com>
 <a8c021fc-ee48-9af9-88ad-e1cd8b162efd@amd.com>
 <SN6PR12MB28009E83A4E519F9E5E9EBF2871C0@SN6PR12MB2800.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b63d4757-0a9f-ac1c-2fec-518b9b4ce4c7@amd.com>
Date: Fri, 7 Feb 2020 14:52:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <SN6PR12MB28009E83A4E519F9E5E9EBF2871C0@SN6PR12MB2800.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:e6::15) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0038.eurprd01.prod.exchangelabs.com (2603:10a6:208:e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend
 Transport; Fri, 7 Feb 2020 13:52:52 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bc8422ea-82d8-42b4-6905-08d7abd5070a
X-MS-TrafficTypeDiagnostic: DM5PR12MB1466:|DM5PR12MB1466:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1466F0F95003683A77B8E4CF831C0@DM5PR12MB1466.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0306EE2ED4
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(189003)(199004)(2616005)(8936002)(6666004)(16526019)(6486002)(316002)(81156014)(36756003)(54906003)(110136005)(81166006)(224303003)(2906002)(186003)(4326008)(31686004)(31696002)(86362001)(478600001)(30864003)(52116002)(5660300002)(66556008)(66476007)(66946007)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1466;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2nhDz4iWmUR4e+8hQ9D60O8vRQ8fSG22SdI2lk3pgVkIwFV8wmJwAk+hnPYPXIwv7iofSIB25HUDLZlZreInM7bcsmWiycUkxyUUJ63mAmSaBaKDrS5mMvJjvLDE8+avBlTTD5w/uwHMY4HAD/8sgafD3h++cltWdgMJlNZ7SStwlk66FzGUFK4m/uJG/h62ZZx2/9uN9Lj0F6N6n6oYhJjRHNFcV4tKhOaU+w2h2VEZWVVAO9KqPLG1UkgdJDQYaEjsdd6nYrswYvh2kHNDEXDKIbqKk/gA0gPUwh9hZqhh/CMOA4Xdv2EV4eUBNn9ZpnAJd4hS+N0pXWAvvtjxrLxd6M3GW2B6EpRpl9c4yCCYioHpRVB775w7VN4eO9636p/LLH7oCF3SzwbUg2fQepcno1cA/xo8O+yEpq1N4lfMUqHQAk4D9O+YxfYHhXv/ONzL004h+pNHHFkfk45FmiTtfgzw29pLRTgv5/datppOn8eyiGQT8ryu/6URPahD
X-MS-Exchange-AntiSpam-MessageData: 73Cugh+/uKRwG6RLqLL/3EcbI++G/3AK8AHmGl56xSsPQt6h7F42mSIekznCut2kZuTMjEtnRvsoUnvI2a/Plvh7BqpNJjHoMuw1AT8E/l2GFsuPTPAjCcEoCyGc2H9L6/Hbow6Xp0y0K9Vh9miTSnr0VvlQN3hur7wy4C3huNDFg1OkagjgO4ane4yZoIOx1s9F0MQ+sTRVaEnXB/Du8Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8422ea-82d8-42b4-6905-08d7abd5070a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2020 13:52:53.4559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXQYYkOTMEplGFwquzylDjeFIjkUTPpX+5TjXxZEu7NtthYzcCIn5oczlEx+S/Dn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1466
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDcuMDIuMjAgdW0gMTQ6NTAgc2NocmllYiBQYW4sIFhpbmh1aToKPiBbQU1EIE9mZmljaWFs
IFVzZSBPbmx5IC0gSW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHldCj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gt6K8/sjLOiBLb2VuaWcsIENocmlzdGlhbiA8
Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPgo+ILeiy83KsbzkOiAyMDIwxOoy1MI3yNUgMjE6NDYK
PiDK1bz+yMs6IFBhbiwgWGluaHVpOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ILOt
y806IEt1ZWhsaW5nLCBGZWxpeDsgRGV1Y2hlciwgQWxleGFuZGVyCj4g1vfM4jogUmU6IFtSRkMg
UEFUQ0ggdjJdIGRybS9hbWRncHU6IFJlbW92ZSBrZmQgZXZpY3Rpb24gZmVuY2UgYmVmb3JlIHJl
bGVhc2UgYm8KPgo+IEFtIDA3LjAyLjIwIHVtIDE0OjQyIHNjaHJpZWIgUGFuLCBYaW5odWk6Cj4+
IE5vIG5lZWQgdG8gdHJpZ2dlciBldmljdGlvbiBhcyB0aGUgbWVtb3J5IG1hcHBpbmcgd2lsbCBu
b3QgYmUgdXNlZCBhbnltb3JlLgo+Pgo+PiBBbGwgcHQvcGQgYm9zIHNoYXJlIHNhbWUgcmVzdiwg
aGVuY2UgdGhlIHNhbWUgc2hhcmVkIGV2aWN0aW9uIGZlbmNlLiBFdmVyeXRpbWUgcGFnZSB0YWJs
ZSBpcyBmcmVlZCwgdGhlIGZlbmNlIHdpbGwgYmUgc2lnbmxlZCBhbmQgdGhhdCBjdWFzZXMga2Zk
IHVuZXhjZXB0ZWQgZXZpY3Rpb25zLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiB4aW5odWkgcGFiIDx4
aW5odWkucGFuQGV4YW1wbGUuY29tPgo+PiAtLS0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2FtZGtmZC5oICAgIHwgIDEgKwo+PiAgICAuLi4vZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyAgfCA3OCArKysrKysrKysrKysrKysrKystCj4+ICAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyAgICB8IDEwICsrLQo+
PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyAgICAgICAgfCAgNSAr
LQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgICAgICAgICAgICAgICAgfCAz
OCArKysrKy0tLS0KPj4gICAgNSBmaWxlcyBjaGFuZ2VkLCAxMTEgaW5zZXJ0aW9ucygrKSwgMjEg
ZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkLmgKPj4gaW5kZXggNDdiMGYyOTU3ZDFmLi4yNjViMWVkNzI2NGMgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaAo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmgKPj4gQEAgLTk2LDYgKzk2LDcg
QEAgc3RydWN0IGFtZGdwdV9hbWRrZmRfZmVuY2UgKmFtZGdwdV9hbWRrZmRfZmVuY2VfY3JlYXRl
KHU2NCBjb250ZXh0LAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSk7Cj4+ICAgIGJvb2wgYW1ka2ZkX2Zl
bmNlX2NoZWNrX21tKHN0cnVjdCBkbWFfZmVuY2UgKmYsIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKTsK
Pj4gICAgc3RydWN0IGFtZGdwdV9hbWRrZmRfZmVuY2UgKnRvX2FtZGdwdV9hbWRrZmRfZmVuY2Uo
c3RydWN0IGRtYV9mZW5jZSAqZik7Cj4+ICtpbnQgYW1kZ3B1X2FtZGtmZF9yZW1vdmVfZmVuY2Vf
b25fcHRfcGRfYm9zKHN0cnVjdCBhbWRncHVfYm8gKmJvKTsKPj4KPj4gICAgc3RydWN0IGFtZGtm
ZF9wcm9jZXNzX2luZm8gewo+PiAgICAgICAgLyogTGlzdCBoZWFkIG9mIGFsbCBWTXMgdGhhdCBi
ZWxvbmcgdG8gYSBLRkQgcHJvY2VzcyAqLwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCj4+IGluZGV4IGVmNzIxY2I2NTg2OC4uMTEzMTUw
OTVjMjliIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
YW1ka2ZkX2dwdXZtLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2FtZGtmZF9ncHV2bS5jCj4+IEBAIC0yMjMsNyArMjIzLDcgQEAgdm9pZCBhbWRncHVfYW1ka2Zk
X3VucmVzZXJ2ZV9tZW1vcnlfbGltaXQoc3RydWN0IGFtZGdwdV9ibyAqYm8pCj4+ICAgIHN0YXRp
YyBpbnQgYW1kZ3B1X2FtZGtmZF9yZW1vdmVfZXZpY3Rpb25fZmVuY2Uoc3RydWN0IGFtZGdwdV9i
byAqYm8sCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBh
bWRncHVfYW1ka2ZkX2ZlbmNlICplZikKPj4gICAgewo+PiAtICAgICBzdHJ1Y3QgZG1hX3Jlc3Yg
KnJlc3YgPSBiby0+dGJvLmJhc2UucmVzdjsKPj4gKyAgICAgc3RydWN0IGRtYV9yZXN2ICpyZXN2
ID0gJmJvLT50Ym8uYmFzZS5fcmVzdjsKPiBUaGF0IHdvbid0IHdvcmsgZWl0aGVyIGFuZCBwcm9i
YWJseSBicmVhayBhIGJ1bmNoIG9mIG90aGVyIGNhc2VzLgo+Cj4gW3hoXSBrZmQgYm9zIHdoaWNo
IGFyZSBhbGxvY2F0ZWQgZXhwbGljaXRseSB1c2UgX3Jlc3YgQUZBSUsuCj4gb25seSBwdC9wZCBi
b3Mgc2hhcmUgdGhlIHJvb3QuX3Jlc3YKCk5vIHRoYXQgaXMgbm90IGNvcnJlY3QuIEltcG9ydHMg
cG90ZW50aWFsbHkgZG9uJ3QgdXNlIF9yZXN2IGhlcmUuCgpBbnl3YXkgcGxlYXNlIHNlZSB0aGUg
cGF0Y2hzZXQgSSd2ZSBwb2ludGVkIG91dCBpbiBvbmUgb2YgbXkgbGFzdCBtYWlscy4gCldpdGgg
dGhhdCB3ZSBjYW4gYXNzaWduIGJvLT50Ym8uYmFzZS5yZXN2IHRvIGJvLT50Ym8uX2Jhc2UgZm9y
IGRlbGV0ZWQgQk9zLgoKQ2hyaXN0aWFuLgoKPgo+IENocmlzdGlhbi4KPgo+PiAgICAgICAgc3Ry
dWN0IGRtYV9yZXN2X2xpc3QgKm9sZCwgKm5ldzsKPj4gICAgICAgIHVuc2lnbmVkIGludCBpLCBq
LCBrOwo+Pgo+PiBAQCAtMjc2LDYgKzI3Niw3OCBAQCBzdGF0aWMgaW50IGFtZGdwdV9hbWRrZmRf
cmVtb3ZlX2V2aWN0aW9uX2ZlbmNlKHN0cnVjdCBhbWRncHVfYm8gKmJvLAo+PiAgICAgICAgcmV0
dXJuIDA7Cj4+ICAgIH0KPj4KPj4gK2ludCBhbWRncHVfYW1ka2ZkX3JlbW92ZV9mZW5jZV9vbl9w
dF9wZF9ib3Moc3RydWN0IGFtZGdwdV9ibyAqYm8pCj4+ICt7Cj4+ICsgICAgIHN0cnVjdCBhbWRn
cHVfdm1fYm9fYmFzZSAgICAgICAgKnZtX2JvID0gYm8tPnZtX2JvOwo+PiArICAgICBzdHJ1Y3Qg
YW1kZ3B1X3ZtICp2bTsKPj4gKyAgICAgc3RydWN0IGFtZGtmZF9wcm9jZXNzX2luZm8gKmluZm87
Cj4+ICsgICAgIHN0cnVjdCBhbWRncHVfYW1ka2ZkX2ZlbmNlICplZjsKPj4gKyAgICAgc3RydWN0
IGFtZGdwdV9ibyAqcGFyZW50Owo+PiArICAgICBpbnQgbG9ja2VkOwo+PiArICAgICBpbnQgcmV0
Owo+PiArICAgICBzdHJ1Y3QgdHRtX2JvX2dsb2JhbCAqZ2xvYiA9ICZ0dG1fYm9fZ2xvYjsKPj4g
Kwo+PiArICAgICBpZiAodm1fYm8gPT0gTlVMTCkKPj4gKyAgICAgICAgICAgICByZXR1cm4gMDsK
Pj4gKwo+PiArICAgICAvKiBQYWdlIHRhYmxlIGJvIGhhcyBhIHJlZmVyZW5jZSBvZiB0aGUgcGFy
ZW50IGJvLgo+PiArICAgICAgKiBCTyBpdHNlbGYgY2FuJ3QgZ3Vhcm50ZWUgdGhlIHZtIGl0IHBv
aW50cyB0byBpcyBhbGl2ZS4KPj4gKyAgICAgICogZm9yIGV4YW1wbGUsIFZNIGlzIGdvaW5nIHRv
IGZyZWUgcGFnZSB0YWJsZXMsIGFuZCB0aGUgcHQvcGQgYm8gbWlnaHQgYmUKPj4gKyAgICAgICog
ZnJlZWQgYnkgYSB3b3JrcXVldWUuIEluIHRoYXQgY2FzZSwgdGhlIHZtIG1pZ2h0IGJlIGZyZWVk
IGFscmVhZHksCj4+ICsgICAgICAqIGxlYXZpbmcgdGhlIGJvLT52bV9ibyBwb2ludHMgdG8gdm0u
cm9vdC4KPj4gKyAgICAgICoKPj4gKyAgICAgICogc28gdG8gYXZvaWQgdGhhdCwgd2hlbiBrZmQg
ZnJlZSBpdHMgdm1zLAo+PiArICAgICAgKiAxKSBzZXQgdm0tPnByb2Nlc3NfaW5mbyB0byBOVUxM
IGlmIHRoaXMgaXMgdGhlIGxhc3Qgdm0uCj4+ICsgICAgICAqIDIpIHNldCByb290X2JvLT52bV9i
byB0byBOVUxMLgo+PiArICAgICAgKgo+PiArICAgICAgKiBidXQgdGhlcmUgYXJlIHN0aWxsIHJh
Y2VzLCBqdXN0IGxpa2UKPj4gKyAgICAgICogY3B1IDEgICAgICAgICAgICAgICAgY3B1IDIKPj4g
KyAgICAgICogICAgICAgICAgICAgICAgICAgICAgIXZtX2JvCj4+ICsgICAgICAqIC0+aW5mbyA9
IE5VTEwKPj4gKyAgICAgICogZnJlZShpbmZvKQo+PiArICAgICAgKiAtPnZtX2JvID0gTlVMTAo+
PiArICAgICAgKiBmcmVlICh2bSkKPj4gKyAgICAgICogICAgICAgICAgICAgICAgICAgICAgaW5m
byA9IHZtLT5pbmZvIC8vaW52YWxpZCB2bQo+PiArICAgICAgKgo+PiArICAgICAgKiBTbyB0byBh
dm9pZCB0aGUgcmFjZSwgdXNlIHR0bV9ib19nbG9iIGxydV9sb2NrLgo+PiArICAgICAgKiBnZW5l
cmFsbHkgc3BlYWtpbmcsIGFkZGluZyBhIG5ldyBsb2NrIGlzIGFjY2NlcHRhYmxlLgo+PiArICAg
ICAgKiBCdXQgcmV1c2luZyB0aGlzIGxvY2sgaXMgc2ltcGxlLgo+PiArICAgICAgKi8KPj4gKyAg
ICAgcGFyZW50ID0gYm87Cj4+ICsgICAgIHdoaWxlIChwYXJlbnQtPnBhcmVudCkKPj4gKyAgICAg
ICAgICAgICBwYXJlbnQgPSBwYXJlbnQtPnBhcmVudDsKPj4gKwo+PiArICAgICBzcGluX2xvY2so
Jmdsb2ItPmxydV9sb2NrKTsKPj4gKyAgICAgdm1fYm8gPSBwYXJlbnQtPnZtX2JvOwo+PiArICAg
ICBpZiAoIXZtX2JvKSB7Cj4+ICsgICAgICAgICAgICAgc3Bpbl91bmxvY2soJmdsb2ItPmxydV9s
b2NrKTsKPj4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPj4gKyAgICAgfQo+PiArCj4+ICsgICAg
IHZtID0gdm1fYm8tPnZtOwo+PiArICAgICBpZiAoIXZtKSB7Cj4+ICsgICAgICAgICAgICAgc3Bp
bl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsKPj4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPj4g
KyAgICAgfQo+PiArCj4+ICsgICAgIGluZm8gPSB2bS0+cHJvY2Vzc19pbmZvOwo+PiArICAgICBp
ZiAoIWluZm8gfHwgIWluZm8tPmV2aWN0aW9uX2ZlbmNlKSB7Cj4+ICsgICAgICAgICAgICAgc3Bp
bl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsKPj4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPj4g
KyAgICAgfQo+PiArCj4+ICsgICAgIGVmID0gY29udGFpbmVyX29mKGRtYV9mZW5jZV9nZXQoJmlu
Zm8tPmV2aWN0aW9uX2ZlbmNlLT5iYXNlKSwKPj4gKyAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBhbWRncHVfYW1ka2ZkX2ZlbmNlLCBiYXNlKTsKPj4gKyAgICAgc3Bpbl91bmxvY2soJmdsb2It
PmxydV9sb2NrKTsKPj4gKwo+PiArICAgICBsb2NrZWQgPSBkbWFfcmVzdl90cnlsb2NrKCZiby0+
dGJvLmJhc2UuX3Jlc3YpOwo+PiArICAgICByZXQgPSBhbWRncHVfYW1ka2ZkX3JlbW92ZV9ldmlj
dGlvbl9mZW5jZShibywgZWYpOwo+PiArICAgICBkbWFfZmVuY2VfcHV0KCZlZi0+YmFzZSk7Cj4+
ICsgICAgIGlmIChsb2NrZWQpCj4+ICsgICAgICAgICAgICAgZG1hX3Jlc3ZfdW5sb2NrKCZiby0+
dGJvLmJhc2UuX3Jlc3YpOwo+PiArICAgICByZXR1cm4gcmV0Owo+PiArfQo+PiArCj4+ICAgIHN0
YXRpYyBpbnQgYW1kZ3B1X2FtZGtmZF9ib192YWxpZGF0ZShzdHJ1Y3QgYW1kZ3B1X2JvICpibywg
dWludDMyX3QgZG9tYWluLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
b29sIHdhaXQpCj4+ICAgIHsKPj4gQEAgLTEwMzAsNiArMTEwMiw3IEBAIHZvaWQgYW1kZ3B1X2Ft
ZGtmZF9ncHV2bV9kZXN0cm95X2NiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+PiAgICB7
Cj4+ICAgICAgICBzdHJ1Y3QgYW1ka2ZkX3Byb2Nlc3NfaW5mbyAqcHJvY2Vzc19pbmZvID0gdm0t
PnByb2Nlc3NfaW5mbzsKPj4gICAgICAgIHN0cnVjdCBhbWRncHVfYm8gKnBkID0gdm0tPnJvb3Qu
YmFzZS5ibzsKPj4gKyAgICAgc3RydWN0IHR0bV9ib19nbG9iYWwgKmdsb2IgPSAmdHRtX2JvX2ds
b2I7Cj4+Cj4+ICAgICAgICBpZiAoIXByb2Nlc3NfaW5mbykKPj4gICAgICAgICAgICAgICAgcmV0
dXJuOwo+PiBAQCAtMTA1MSw2ICsxMTI0LDkgQEAgdm9pZCBhbWRncHVfYW1ka2ZkX2dwdXZtX2Rl
c3Ryb3lfY2Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+ICAgICAgICAgICAgICAgIFdB
Uk5fT04oIWxpc3RfZW1wdHkoJnByb2Nlc3NfaW5mby0+dXNlcnB0cl92YWxpZF9saXN0KSk7Cj4+
ICAgICAgICAgICAgICAgIFdBUk5fT04oIWxpc3RfZW1wdHkoJnByb2Nlc3NfaW5mby0+dXNlcnB0
cl9pbnZhbF9saXN0KSk7Cj4+Cj4+ICsgICAgICAgICAgICAgc3Bpbl9sb2NrKCZnbG9iLT5scnVf
bG9jayk7Cj4+ICsgICAgICAgICAgICAgdm0tPnByb2Nlc3NfaW5mbyA9IE5VTEw7Cj4+ICsgICAg
ICAgICAgICAgc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsKPj4gICAgICAgICAgICAgICAg
ZG1hX2ZlbmNlX3B1dCgmcHJvY2Vzc19pbmZvLT5ldmljdGlvbl9mZW5jZS0+YmFzZSk7Cj4+ICAg
ICAgICAgICAgICAgIGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmcHJvY2Vzc19pbmZvLT5yZXN0
b3JlX3VzZXJwdHJfd29yayk7Cj4+ICAgICAgICAgICAgICAgIHB1dF9waWQocHJvY2Vzc19pbmZv
LT5waWQpOwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4+
IGluZGV4IDZmNjBhNTgxZTNiYS4uNmFkMTIyOThmYTg0IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4+IEBAIC0xMzA3LDE5ICsxMzA3LDIzIEBA
IHZvaWQgYW1kZ3B1X2JvX3JlbGVhc2Vfbm90aWZ5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8pCj4+ICAgICAgICBpZiAoYWJvLT5rZmRfYm8pCj4+ICAgICAgICAgICAgICAgIGFtZGdwdV9h
bWRrZmRfdW5yZXNlcnZlX21lbW9yeV9saW1pdChhYm8pOwo+Pgo+PiArICAgICBhbWRncHVfYW1k
a2ZkX3JlbW92ZV9mZW5jZV9vbl9wdF9wZF9ib3MoYWJvKTsKPj4gKyAgICAgYWJvLT52bV9ibyA9
IE5VTEw7Cj4+ICsKPj4gICAgICAgIGlmIChiby0+bWVtLm1lbV90eXBlICE9IFRUTV9QTF9WUkFN
IHx8ICFiby0+bWVtLm1tX25vZGUgfHwKPj4gICAgICAgICAgICAhKGFiby0+ZmxhZ3MgJiBBTURH
UFVfR0VNX0NSRUFURV9WUkFNX1dJUEVfT05fUkVMRUFTRSkpCj4+ICAgICAgICAgICAgICAgIHJl
dHVybjsKPj4KPj4gLSAgICAgZG1hX3Jlc3ZfbG9jayhiby0+YmFzZS5yZXN2LCBOVUxMKTsKPj4g
KyAgICAgLyogT25seSBrZmQgYm8gd2lwZSB2cmFtIG9uIHJlbGVhc2UuIFRoZSByZXN2IGlzICZf
cmVzdi4gKi8KPj4gKyAgICAgZG1hX3Jlc3ZfbG9jaygmYm8tPmJhc2UuX3Jlc3YsIE5VTEwpOwo+
Pgo+PiAtICAgICByID0gYW1kZ3B1X2ZpbGxfYnVmZmVyKGFibywgQU1ER1BVX1BPSVNPTiwgYm8t
PmJhc2UucmVzdiwgJmZlbmNlKTsKPj4gKyAgICAgciA9IGFtZGdwdV9maWxsX2J1ZmZlcihhYm8s
IEFNREdQVV9QT0lTT04sICZiby0+YmFzZS5fcmVzdiwgJmZlbmNlKTsKPj4gICAgICAgIGlmICgh
V0FSTl9PTihyKSkgewo+PiAgICAgICAgICAgICAgICBhbWRncHVfYm9fZmVuY2UoYWJvLCBmZW5j
ZSwgZmFsc2UpOwo+PiAgICAgICAgICAgICAgICBkbWFfZmVuY2VfcHV0KGZlbmNlKTsKPj4gICAg
ICAgIH0KPj4KPj4gLSAgICAgZG1hX3Jlc3ZfdW5sb2NrKGJvLT5iYXNlLnJlc3YpOwo+PiArICAg
ICBkbWFfcmVzdl91bmxvY2soJmJvLT5iYXNlLl9yZXN2KTsKPj4gICAgfQo+Pgo+PiAgICAvKioK
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPj4gaW5kZXggY2M1NmVhYmEx
OTExLi4yYjk2NDQ3ZTMwZTUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92bS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5jCj4+IEBAIC05NDUsNyArOTQ1LDYgQEAgc3RhdGljIGludCBhbWRncHVfdm1fYWxsb2Nf
cHRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+PiAgICBzdGF0aWMgdm9pZCBhbWRncHVf
dm1fZnJlZV90YWJsZShzdHJ1Y3QgYW1kZ3B1X3ZtX3B0ICplbnRyeSkKPj4gICAgewo+PiAgICAg
ICAgaWYgKGVudHJ5LT5iYXNlLmJvKSB7Cj4+IC0gICAgICAgICAgICAgZW50cnktPmJhc2UuYm8t
PnZtX2JvID0gTlVMTDsKPj4gICAgICAgICAgICAgICAgbGlzdF9kZWwoJmVudHJ5LT5iYXNlLnZt
X3N0YXR1cyk7Cj4+ICAgICAgICAgICAgICAgIGFtZGdwdV9ib191bnJlZigmZW50cnktPmJhc2Uu
Ym8tPnNoYWRvdyk7Cj4+ICAgICAgICAgICAgICAgIGFtZGdwdV9ib191bnJlZigmZW50cnktPmJh
c2UuYm8pOwo+PiBAQCAtMzA3NCw2ICszMDczLDcgQEAgdm9pZCBhbWRncHVfdm1fZmluaShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0pCj4+ICAgICAgICBz
dHJ1Y3QgYW1kZ3B1X2JvX3ZhX21hcHBpbmcgKm1hcHBpbmcsICp0bXA7Cj4+ICAgICAgICBib29s
IHBydF9maW5pX25lZWRlZCA9ICEhYWRldi0+Z21jLmdtY19mdW5jcy0+c2V0X3BydDsKPj4gICAg
ICAgIHN0cnVjdCBhbWRncHVfYm8gKnJvb3Q7Cj4+ICsgICAgIHN0cnVjdCB0dG1fYm9fZ2xvYmFs
ICpnbG9iID0gJnR0bV9ib19nbG9iOwo+PiAgICAgICAgaW50IGk7Cj4+Cj4+ICAgICAgICBhbWRn
cHVfYW1ka2ZkX2dwdXZtX2Rlc3Ryb3lfY2IoYWRldiwgdm0pOwo+PiBAQCAtMzEwNSw2ICszMTA1
LDkgQEAgdm9pZCBhbWRncHVfdm1fZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3Ry
dWN0IGFtZGdwdV92bSAqdm0pCj4+ICAgICAgICB9Cj4+Cj4+ICAgICAgICBhbWRncHVfdm1fZnJl
ZV9wdHMoYWRldiwgdm0sIE5VTEwpOwo+PiArICAgICBzcGluX2xvY2soJmdsb2ItPmxydV9sb2Nr
KTsKPj4gKyAgICAgcm9vdC0+dm1fYm8gPSBOVUxMOwo+PiArICAgICBzcGluX3VubG9jaygmZ2xv
Yi0+bHJ1X2xvY2spOwo+PiAgICAgICAgYW1kZ3B1X2JvX3VucmVzZXJ2ZShyb290KTsKPj4gICAg
ICAgIGFtZGdwdV9ib191bnJlZigmcm9vdCk7Cj4+ICAgICAgICBXQVJOX09OKHZtLT5yb290LmJh
c2UuYm8pOwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4gaW5kZXggMTQ5NGFlYmI4MTI4Li43MDZjZDYw
ZWI5ZTAgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+PiBAQCAtNDI5LDggKzQyOSw4IEBAIHN0
YXRpYyBpbnQgdHRtX2JvX2luZGl2aWR1YWxpemVfcmVzdihzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvKQo+PiAgICAgICAgQlVHX09OKCFkbWFfcmVzdl90cnlsb2NrKCZiby0+YmFzZS5fcmVz
dikpOwo+Pgo+PiAgICAgICAgciA9IGRtYV9yZXN2X2NvcHlfZmVuY2VzKCZiby0+YmFzZS5fcmVz
diwgYm8tPmJhc2UucmVzdik7Cj4+IC0gICAgIGlmIChyKQo+PiAtICAgICAgICAgICAgIGRtYV9y
ZXN2X3VubG9jaygmYm8tPmJhc2UuX3Jlc3YpOwo+PiArCj4+ICsgICAgIGRtYV9yZXN2X3VubG9j
aygmYm8tPmJhc2UuX3Jlc3YpOwo+Pgo+PiAgICAgICAgcmV0dXJuIHI7Cj4+ICAgIH0KPj4gQEAg
LTQ1NSwyMyArNDU1LDE5IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19mbHVzaF9hbGxfZmVuY2VzKHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCj4+ICAgICAgICB9Cj4+ICAgIH0KPj4KPj4gLXN0
YXRpYyB2b2lkIHR0bV9ib19jbGVhbnVwX3JlZnNfb3JfcXVldWUoc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICpibykKPj4gK3N0YXRpYyB2b2lkIHR0bV9ib19jbGVhbnVwX3JlZnNfb3JfcXVldWUo
c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgYm9vbCBlbnF1ZXVlKQo+PiAgICB7Cj4+ICAg
ICAgICBzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiA9IGJvLT5iZGV2Owo+PiAgICAgICAgaW50
IHJldDsKPj4KPj4gLSAgICAgcmV0ID0gdHRtX2JvX2luZGl2aWR1YWxpemVfcmVzdihibyk7Cj4+
IC0gICAgIGlmIChyZXQpIHsKPj4gLSAgICAgICAgICAgICAvKiBMYXN0IHJlc29ydCwgaWYgd2Ug
ZmFpbCB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIHRoZQo+PiAtICAgICAgICAgICAgICAqIGZlbmNl
cyBibG9jayBmb3IgdGhlIEJPIHRvIGJlY29tZSBpZGxlCj4+IC0gICAgICAgICAgICAgICovCj4+
IC0gICAgICAgICAgICAgZG1hX3Jlc3Zfd2FpdF90aW1lb3V0X3JjdShiby0+YmFzZS5yZXN2LCB0
cnVlLCBmYWxzZSwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAzMCAqIEhaKTsKPj4gLSAgICAgICAgICAgICBzcGluX2xvY2soJnR0bV9ib19nbG9i
LmxydV9sb2NrKTsKPj4gLSAgICAgICAgICAgICBnb3RvIGVycm9yOwo+PiAtICAgICB9Cj4+IC0K
Pj4gICAgICAgIHNwaW5fbG9jaygmdHRtX2JvX2dsb2IubHJ1X2xvY2spOwo+PiArCj4+ICsgICAg
IGlmIChlbnF1ZXVlKQo+PiArICAgICAgICAgICAgIGdvdG8gcXVldWU7Cj4+ICsKPj4gKyAgICAg
aWYgKGJvLT5iYXNlLnJlc3YgIT0gJmJvLT5iYXNlLl9yZXN2KQo+PiArICAgICAgICAgICAgIEJV
R19PTighZG1hX3Jlc3ZfdHJ5bG9jaygmYm8tPmJhc2UuX3Jlc3YpKTsKPj4gKwo+PiAgICAgICAg
cmV0ID0gZG1hX3Jlc3ZfdHJ5bG9jayhiby0+YmFzZS5yZXN2KSA/IDAgOiAtRUJVU1k7Cj4+ICAg
ICAgICBpZiAoIXJldCkgewo+PiAgICAgICAgICAgICAgICBpZiAoZG1hX3Jlc3ZfdGVzdF9zaWdu
YWxlZF9yY3UoJmJvLT5iYXNlLl9yZXN2LCB0cnVlKSkgewo+PiBAQCAtNTA0LDcgKzUwMCw3IEBA
IHN0YXRpYyB2b2lkIHR0bV9ib19jbGVhbnVwX3JlZnNfb3JfcXVldWUoc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibykKPj4gICAgICAgICAgICAgICAgZG1hX3Jlc3ZfdW5sb2NrKCZiby0+YmFz
ZS5fcmVzdik7Cj4+ICAgICAgICB9Cj4+Cj4+IC1lcnJvcjoKPj4gK3F1ZXVlOgo+PiAgICAgICAg
a3JlZl9nZXQoJmJvLT5saXN0X2tyZWYpOwo+PiAgICAgICAgbGlzdF9hZGRfdGFpbCgmYm8tPmRk
ZXN0cm95LCAmYmRldi0+ZGRlc3Ryb3kpOwo+PiAgICAgICAgc3Bpbl91bmxvY2soJnR0bV9ib19n
bG9iLmxydV9sb2NrKTsKPj4gQEAgLTY1NSw2ICs2NTEsMTYgQEAgc3RhdGljIHZvaWQgdHRtX2Jv
X3JlbGVhc2Uoc3RydWN0IGtyZWYgKmtyZWYpCj4+ICAgICAgICAgICAgY29udGFpbmVyX29mKGty
ZWYsIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCwga3JlZik7Cj4+ICAgICAgICBzdHJ1Y3QgdHRt
X2JvX2RldmljZSAqYmRldiA9IGJvLT5iZGV2Owo+PiAgICAgICAgc3RydWN0IHR0bV9tZW1fdHlw
ZV9tYW5hZ2VyICptYW4gPSAmYmRldi0+bWFuW2JvLT5tZW0ubWVtX3R5cGVdOwo+PiArICAgICBp
bnQgcmV0Owo+PiArCj4+ICsgICAgIHJldCA9IHR0bV9ib19pbmRpdmlkdWFsaXplX3Jlc3YoYm8p
Owo+PiArICAgICBpZiAocmV0KSB7Cj4+ICsgICAgICAgICAgICAgLyogTGFzdCByZXNvcnQsIGlm
IHdlIGZhaWwgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciB0aGUKPj4gKyAgICAgICAgICAgICAgKiBm
ZW5jZXMgYmxvY2sgZm9yIHRoZSBCTyB0byBiZWNvbWUgaWRsZQo+PiArICAgICAgICAgICAgICAq
Lwo+PiArICAgICAgICAgICAgIGRtYV9yZXN2X3dhaXRfdGltZW91dF9yY3UoYm8tPmJhc2UucmVz
diwgdHJ1ZSwgZmFsc2UsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDMwICogSFop
Owo+PiArICAgICB9Cj4+Cj4+ICAgICAgICBpZiAoYm8tPmJkZXYtPmRyaXZlci0+cmVsZWFzZV9u
b3RpZnkpCj4+ICAgICAgICAgICAgICAgIGJvLT5iZGV2LT5kcml2ZXItPnJlbGVhc2Vfbm90aWZ5
KGJvKTsKPj4gQEAgLTY2Myw3ICs2NjksNyBAQCBzdGF0aWMgdm9pZCB0dG1fYm9fcmVsZWFzZShz
dHJ1Y3Qga3JlZiAqa3JlZikKPj4gICAgICAgIHR0bV9tZW1faW9fbG9jayhtYW4sIGZhbHNlKTsK
Pj4gICAgICAgIHR0bV9tZW1faW9fZnJlZV92bShibyk7Cj4+ICAgICAgICB0dG1fbWVtX2lvX3Vu
bG9jayhtYW4pOwo+PiAtICAgICB0dG1fYm9fY2xlYW51cF9yZWZzX29yX3F1ZXVlKGJvKTsKPj4g
KyAgICAgdHRtX2JvX2NsZWFudXBfcmVmc19vcl9xdWV1ZShibywgISFyZXQpOwo+PiAgICAgICAg
a3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNlX2xpc3QpOwo+PiAgICB9Cj4+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
