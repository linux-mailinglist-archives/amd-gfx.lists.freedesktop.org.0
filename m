Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4831210A093
	for <lists+amd-gfx@lfdr.de>; Tue, 26 Nov 2019 15:42:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B876E402;
	Tue, 26 Nov 2019 14:42:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770087.outbound.protection.outlook.com [40.107.77.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289486E402
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 Nov 2019 14:42:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiCkRcLCXHC0W+QGE90dxDfadJHzn+ci6XRmxors5xTwzOGHTuoK5/61SVLgTHpHsNGS53VjuwCBTZZesx+OyKWf54ltQ08YqrmbXj3X5BzJZWTM892TxAEM4NX5Vw+jE3lfo161hVrJgPcBEeOB0pap/LHT1lFwbfhxUBcvW3JzzzA+TRXcZTqxDOyIZftSGoh+HdvkRe46AQqQRbioSNVv6tSkFIDvVXhc0iwnv3fM5o4UbMrnT//SBOqEAgA+/lCqgnIMEHNrKjQlCcmcmzyITup6Eta3QaH2PioRKiaApJ4UZLLrF+vmKwBwwNOUzZoM8X7k2JNoBLAYIaWjTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ecFpAS/2hUCSuA4xyJ1IG0Z+uh/o9/8sxMTTqnf+54=;
 b=RL2OWDdzYpXNxeWjQIg8+uFbJBkYhG8fiLHYK4TRkKrx2Y9SC/tBdVjjmh3aS60f1AW4oUnRQyJyk2nIuGQB6YU3aElyD9N6GnDJwMlX6Qd8iTaSUIrrGh5QGhwkK/IzFrVs+13vg7Iv0RmoY6nBi66z4mV/eayiddwt7GAX6TbqOJ/AKeGODgqbbH2XWpH6U36c35VHUnwvvzRLeuVIqdlzjyoGRL9abWRPvG5xvRW2vmtcZY/iSF8dBm9pDz1CnxCyUc644xfTSyHVu9ZQlM34aFetVODrTPcoqBsCBBGZssDytc8zqiX11rBL2+U983nQ42TXPDxJpdGs0f2UCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB2406.namprd12.prod.outlook.com (52.132.142.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Tue, 26 Nov 2019 14:42:10 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::b8ee:257d:3a23:ae8a]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::b8ee:257d:3a23:ae8a%7]) with mapi id 15.20.2495.014; Tue, 26 Nov 2019
 14:42:10 +0000
Subject: Re: [RFC PATCH] drm/amdgpu: allocate entities on demand
To: christian.koenig@amd.com, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 alexander.deucher@amd.com, kenny.ho@amd.com
References: <20191125231719.108949-1-nirmoy.das@amd.com>
 <2e514ab3-1582-6508-d81a-cbc2d12f42d7@amd.com>
 <74fd0faf-fd99-e33e-8d7a-95f9bb8be26a@gmail.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <7aa2fe66-939e-e15e-5b23-474173872d25@amd.com>
Date: Tue, 26 Nov 2019 15:41:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
In-Reply-To: <74fd0faf-fd99-e33e-8d7a-95f9bb8be26a@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR04CA0146.eurprd04.prod.outlook.com (2603:10a6:207::30)
 To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
X-Originating-IP: [2003:c5:8f47:2200:861b:9d7e:fdf4:bdc4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 684c7b25-90ec-4adf-28a2-08d7727ed1a4
X-MS-TrafficTypeDiagnostic: DM5PR12MB2406:|DM5PR12MB2406:
X-MS-Exchange-PUrlCount: 1
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2406715742650DCD80D078738B450@DM5PR12MB2406.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0233768B38
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(189003)(199004)(81156014)(31686004)(81166006)(14444005)(6246003)(7736002)(386003)(6506007)(53546011)(6636002)(66574012)(36756003)(5660300002)(50466002)(11346002)(2616005)(446003)(99286004)(186003)(316002)(31696002)(23676004)(2486003)(966005)(305945005)(14454004)(478600001)(46003)(65956001)(229853002)(25786009)(6116002)(8676002)(6486002)(6512007)(6306002)(6436002)(52116002)(2906002)(58126008)(76176011)(2870700001)(8936002)(66556008)(66946007)(45080400002)(66476007)(6666004)(47776003)(65806001)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2406;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IaHrY9uiW+kVV2CduxkXvv550o+GZuvOHNWhhHr7/o8peZjKkkal3lUU25gMjGKcjPHtCmuefPT88f3MUdTChu08UmL+U7CFo4KV9UssZ/tYBX5Ajwz66m7cq4qB+JDWugVMpzOsge7cgzg7p3E5V26yTt/BeRJ4ZeK0erXak+xZhDOdiRVYpU6Ue9eLpERozkkbKoh0lfcu/A59lQzzw9KARO1cxM32Dz6R0fJqX2Rebej15CJK3N9FHV0rt8sJFGAgc+5kdBN6FS7gi6GoEkO7uZmjHMLQH5gRFcPTvHoHsQz8XsjCKR0Hx6O4YpSBPwFd+sq6t7Zdb1FhAeEFpxtpozugLUphT/yu9KMCgrphzsojjf4DPsYekxpSj4kJjsuH3c/3tPoE6a778jGUYMAg8rJbxj7Ul9xsKb4uZRHhtpRxPrwnzbE/OSk3jdENyU2N1pb9iYT1xiGl+UZkUwHYM9isJHX+k3Den133tIo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 684c7b25-90ec-4adf-28a2-08d7727ed1a4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 14:42:10.7265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DQSdOBwfWeyUm/Eed9t0NBF3Iioe45c2Fhuu1fzDd3rqDO1giLCkNkktAW4FyadfXEzp+UM0ZEjm9otgIbLeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2406
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ecFpAS/2hUCSuA4xyJ1IG0Z+uh/o9/8sxMTTqnf+54=;
 b=ntR2ayzbgp7UTC7hoJv6xKGbqnigrQtPvYEVFJ1As1+b5Rb3exkSXIn6TSlbKdHcNRG1RdYcDrF2ed34wP0e0QsB35oTtazoFjVZrRTyWSR8esMmZMpcS21AS7zEOiQM+UQgi5H4g4oEA0/AROrigx72OGeJ5qeTG2K1UIbmkvg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
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
Cc: nirmoy.das@amd.com, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIENocmlzdGlhbiBmb3IgcmV2aWV3aW5nIGl0LsKgIEkgd2lsbCB0cnkgdG8gY2xlYW51
cCAKZHJtX3NjaGVkX2VudGl0eV9zZXRfcHJpb3JpdHkgYW5kIGNvbWUgdXAgd2l0aCBhbm90aGVy
IHBhdGNoLgoKT24gMTEvMjYvMTkgMTA6NDUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4g
SXQgbG9va3MgbGlrZSBhIHN0YXJ0LCBidXQgdGhlcmUgbnVtZXJvdXMgdGhpbmdzIHdoaWNoIG5l
ZWRzIHRvIGJlIGZpeGVkLgo+Cj4gUXVlc3Rpb24gbnVtYmVyIG9uZSBpczogV2hhdCdzIHRoYXQg
Z29vZCBmb3I/IEVudGl0aWVzIGFyZSBub3QgdGhlIAo+IHByb2JsZW0gaGVyZS4gVGhlIHJlYWwg
aXNzdWUgaXMgdGhlIGZlbmNlIHJpbmcgYW5kIHRoZSBycV9saXN0Lgo+Cj4gVGhlIHJxX2xpc3Qg
Y291bGQgYWN0dWFsbHkgYmUgbWFkZSBjb25zdGFudCBzaW5jZSBpdCBzaG91bGQgbmV2ZXIgYmUg
Cj4gY2hhbmdlZCBieSB0aGUgZW50aXR5LiBJdCBpcyBvbmx5IGNoYW5nZWQgZm9yIGJhY2t3YXJk
IGNvbXBhdGliaWxpdHkgCj4gaW4gZHJtX3NjaGVkX2VudGl0eV9zZXRfcHJpb3JpdHkoKS4KPgo+
IFNvIEkgd291bGQgc3RhcnQgdGhlcmUgYW5kIGNsZWFudXAgdGhlIGRybV9zY2hlZF9lbnRpdHlf
c2V0X3ByaW9yaXR5KCkgCj4gdG8gYWN0dWFsbHkganVzdCBzZXQgYSBuZXcgY29uc3RhbnQgcnEg
bGlzdCBpbnN0ZWFkLgo+Cj4gVGhlbiB3ZSBjb3VsZCBlbWJlZCB0aGUgZmVuY2VzIGluIGFtZGdw
dV9jdHhfZW50aXR5IGFzIGR5bmFtaWMgYXJyYXkgCj4gYXQgdGhlIGVuZCBvZiB0aGUgc3RydWN0
dXJlLgo+Cj4gQW5kIGxhc3Qgd2UgY2FuIHN0YXJ0IHRvIGR5bmFtaWMgYWxsb2NhdGUgYW5kIGlu
aXRpYWxpemUgdGhlIAo+IGFtZGdwdV9jdHhfZW50aXR5KCkgc3RydWN0dXJlcy4KPgo+IFJlZ2Fy
ZHMsCj4gQ2hyaXN0aWFuLgo+Cj4gQW0gMjYuMTEuMTkgdW0gMDA6MzEgc2NocmllYiBOaXJtb3k6
Cj4+IFJhbiBhbWRncHVfdGVzdChkcm0pIHN1Y2Nlc3NmdWxseSBtdWx0aXBsZSB0aW1lcyB0byB0
ZXN0IHRoaXMuIEJ1dCBJIAo+PiBhbSBwcmV0dHkgc3VyZSBJIGFtIG1pc3Npbmcgc29tZSBjb3Ju
ZXIgY2FzZSBoZXJlLgo+Pgo+Pgo+PiBSZWdhcmRzLAo+Pgo+PiBOaXJtb3kKPj4KPj4gT24gMTEv
MjYvMTkgMTI6MTcgQU0sIE5pcm1veSBEYXMgd3JvdGU6Cj4+PiBDdXJyZW50bHkgd2UgcHJlLWFs
bG9jYXRlIGVudGl0aWVzIGZvciBhbGwgdGhlIEhXIElQcyBvbgo+Pj4gY29udGV4dCBjcmVhdGlv
biBhbmQgc29tZSBvZiB3aGljaCBhcmUgbWlnaHQgbmV2ZXIgYmUgdXNlZC4KPj4+Cj4+PiBUaGlz
IHBhdGNoIHRyaWVzIHRvIHJlc29sdmUgZW50aXR5IHdhc3RhZ2UgYnkgY3JlYXRpbmcgZW50aXRp
ZXMKPj4+IGZvciBhIEhXIElQIG9ubHkgd2hlbiBpdCBpcyByZXF1aXJlZC4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+Cj4+PiAtLS0KPj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYyB8IDE0MiAKPj4+ICsrKysr
KysrKysrKysrLS0tLS0tLS0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDgxIGluc2VydGlvbnMo
KyksIDYxIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfY3R4LmMgCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9jdHguYwo+Pj4gaW5kZXggYTBkM2Q3Yjc1NmViLi4wYTM5MGViZTg3M2YgMTAwNjQ0
Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKPj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYwo+Pj4gQEAgLTc0LDcg
Kzc0LDcgQEAgc3RhdGljIGludCBhbWRncHVfY3R4X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
Cj4+PiAqYWRldiwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBh
bWRncHVfY3R4ICpjdHgpCj4+PiDCoCB7Cj4+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIG51bV9lbnRp
dGllcyA9IGFtZGdwdV9jdHhfdG90YWxfbnVtX2VudGl0aWVzKCk7Cj4+PiAtwqDCoMKgIHVuc2ln
bmVkIGksIGosIGs7Cj4+PiArwqDCoMKgIHVuc2lnbmVkIGk7Cj4+PiDCoMKgwqDCoMKgIGludCBy
Owo+Pj4gwqAgwqDCoMKgwqDCoCBpZiAocHJpb3JpdHkgPCAwIHx8IHByaW9yaXR5ID49IERSTV9T
Q0hFRF9QUklPUklUWV9NQVgpCj4+PiBAQCAtMTAzLDcgKzEwMyw3IEBAIHN0YXRpYyBpbnQgYW1k
Z3B1X2N0eF9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlIAo+Pj4gKmFkZXYsCj4+PiDCoMKgwqDC
oMKgIGZvciAoaSA9IDA7IGkgPCBudW1fZW50aXRpZXM7ICsraSkgewo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHN0cnVjdCBhbWRncHVfY3R4X2VudGl0eSAqZW50aXR5ID0gJmN0eC0+ZW50aXRpZXNb
MF1baV07Cj4+PiDCoCAtwqDCoMKgwqDCoMKgwqAgZW50aXR5LT5zZXF1ZW5jZSA9IDE7Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgZW50aXR5LT5zZXF1ZW5jZSA9IC0xOwo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGVudGl0eS0+ZmVuY2VzID0gJmN0eC0+ZmVuY2VzW2FtZGdwdV9zY2hlZF9qb2JzICogaV07
Cj4+PiDCoMKgwqDCoMKgIH0KPj4+IMKgwqDCoMKgwqAgZm9yIChpID0gMTsgaSA8IEFNREdQVV9I
V19JUF9OVU07ICsraSkKPj4+IEBAIC0xMjAsMjUgKzEyMCw1OSBAQCBzdGF0aWMgaW50IGFtZGdw
dV9jdHhfaW5pdChzdHJ1Y3QgCj4+PiBhbWRncHVfZGV2aWNlICphZGV2LAo+Pj4gwqDCoMKgwqDC
oCBjdHgtPmluaXRfcHJpb3JpdHkgPSBwcmlvcml0eTsKPj4+IMKgwqDCoMKgwqAgY3R4LT5vdmVy
cmlkZV9wcmlvcml0eSA9IERSTV9TQ0hFRF9QUklPUklUWV9VTlNFVDsKPj4+IMKgIC3CoMKgwqAg
Zm9yIChpID0gMDsgaSA8IEFNREdQVV9IV19JUF9OVU07ICsraSkgewo+Pj4gLcKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBhbWRncHVfcmluZyAqcmluZ3NbQU1ER1BVX01BWF9SSU5HU107Cj4+PiAtwqDC
oMKgwqDCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9ycSAqcnFzW0FNREdQVV9NQVhfUklOR1NdOwo+
Pj4gLcKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIG51bV9yaW5ncyA9IDA7Cj4+PiAtwqDCoMKgwqDC
oMKgwqAgdW5zaWduZWQgbnVtX3JxcyA9IDA7Cj4+PiArwqDCoMKgIHJldHVybiAwOwo+Pj4gKwo+
Pj4gK2Vycm9yX2ZyZWVfZmVuY2VzOgo+Pj4gK8KgwqDCoCBrZnJlZShjdHgtPmZlbmNlcyk7Cj4+
PiArwqDCoMKgIGN0eC0+ZmVuY2VzID0gTlVMTDsKPj4+ICvCoMKgwqAgcmV0dXJuIHI7Cj4+PiAr
fQo+Pj4gKwo+Pj4gK3N0YXRpYyB2b2lkIGFtZGdwdV9jdHhfZmluaShzdHJ1Y3Qga3JlZiAqcmVm
KQo+Pj4gK3sKPj4+ICvCoMKgwqAgc3RydWN0IGFtZGdwdV9jdHggKmN0eCA9IGNvbnRhaW5lcl9v
ZihyZWYsIHN0cnVjdCBhbWRncHVfY3R4LCAKPj4+IHJlZmNvdW50KTsKPj4+ICvCoMKgwqAgdW5z
aWduZWQgbnVtX2VudGl0aWVzID0gYW1kZ3B1X2N0eF90b3RhbF9udW1fZW50aXRpZXMoKTsKPj4+
ICvCoMKgwqAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBjdHgtPmFkZXY7Cj4+PiArwqDC
oMKgIHVuc2lnbmVkIGksIGo7Cj4+PiArCj4+PiArwqDCoMKgIGlmICghYWRldikKPj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm47Cj4+PiArCj4+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBudW1f
ZW50aXRpZXM7ICsraSkKPj4+ICvCoMKgwqDCoMKgwqDCoCBmb3IgKGogPSAwOyBqIDwgYW1kZ3B1
X3NjaGVkX2pvYnM7ICsraikKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9w
dXQoY3R4LT5lbnRpdGllc1swXVtpXS5mZW5jZXNbal0pOwo+Pj4gK8KgwqDCoCBrZnJlZShjdHgt
PmZlbmNlcyk7Cj4+PiArwqDCoMKgIGtmcmVlKGN0eC0+ZW50aXRpZXNbMF0pOwo+Pj4gKwo+Pj4g
K8KgwqDCoCBtdXRleF9kZXN0cm95KCZjdHgtPmxvY2spOwo+Pj4gKwo+Pj4gK8KgwqDCoCBrZnJl
ZShjdHgpOwo+Pj4gK30KPj4+IMKgIC3CoMKgwqDCoMKgwqDCoCBzd2l0Y2ggKGkpIHsKPj4+ICsK
Pj4+ICtpbnQgYW1kZ3B1X2N0eF9pbml0X2VudGl0eShzdHJ1Y3QgYW1kZ3B1X2N0eCAqY3R4LCB1
MzIgaHdfaXApCj4+IFRoaXMgc2hvdWxkIGJlIGEgc3RhdGljIGZ1bmN0aW9uIHdoaWNoIEkgZm9y
Z290IHRvIGNoYW5nZQo+Pj4gK3sKPj4+ICvCoMKgwqAgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5n
c1tBTURHUFVfTUFYX1JJTkdTXTsKPj4+ICvCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9ycSAqcnFz
W0FNREdQVV9NQVhfUklOR1NdOwo+Pj4gK8KgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diA9IGN0eC0+YWRldjsKPj4+ICvCoMKgwqAgdW5zaWduZWQgbnVtX3JpbmdzID0gMDsKPj4+ICvC
oMKgwqAgdW5zaWduZWQgbnVtX3JxcyA9IDA7Cj4+PiArwqDCoMKgIHVuc2lnbmVkIGksIGo7Cj4+
PiArwqDCoMKgIGludCByID0gMDsKPj4+ICsKPj4+ICvCoMKgwqAgc3dpdGNoIChod19pcCkgewo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgQU1ER1BVX0hXX0lQX0dGWDoKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJpbmdzWzBdID0gJmFkZXYtPmdmeC5nZnhfcmluZ1swXTsKPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG51bV9yaW5ncyA9IDE7Cj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIEFNREdQ
VV9IV19JUF9DT01QVVRFOgo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChqID0gMDsg
aiA8IGFkZXYtPmdmeC5udW1fY29tcHV0ZV9yaW5nczsgKytqKQo+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByaW5nc1tqXSA9ICZhZGV2LT5nZnguY29tcHV0ZV9yaW5nW2pdOwo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IGFkZXYtPmdmeC5udW1f
Y29tcHV0ZV9yaW5nczsgKytpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
aW5nc1tpXSA9ICZhZGV2LT5nZnguY29tcHV0ZV9yaW5nW2ldOwo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgbnVtX3JpbmdzID0gYWRldi0+Z2Z4Lm51bV9jb21wdXRlX3JpbmdzOwo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
Y2FzZSBBTURHUFVfSFdfSVBfRE1BOgo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChq
ID0gMDsgaiA8IGFkZXYtPnNkbWEubnVtX2luc3RhbmNlczsgKytqKQo+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByaW5nc1tqXSA9ICZhZGV2LT5zZG1hLmluc3RhbmNlW2pdLnJp
bmc7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgYWRldi0+c2Rt
YS5udW1faW5zdGFuY2VzOyArK2kpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJpbmdzW2ldID0gJmFkZXYtPnNkbWEuaW5zdGFuY2VbaV0ucmluZzsKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIG51bV9yaW5ncyA9IGFkZXYtPnNkbWEubnVtX2luc3RhbmNlczsKPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGNhc2UgQU1ER1BVX0hXX0lQX1VWRDoKPj4+IEBAIC0xNTQsODAgKzE4OCw1OSBAQCBzdGF0aWMg
aW50IGFtZGdwdV9jdHhfaW5pdChzdHJ1Y3QgCj4+PiBhbWRncHVfZGV2aWNlICphZGV2LAo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnVtX3JpbmdzID0gMTsKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgQU1ER1BV
X0hXX0lQX1ZDTl9ERUM6Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGogPSAwOyBq
IDwgYWRldi0+dmNuLm51bV92Y25faW5zdDsgKytqKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChhZGV2LT52Y24uaGFydmVzdF9jb25maWcgJiAoMSA8PCBqKSkKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBhZGV2LT52Y24ubnVtX3Zj
bl9pbnN0OyArK2kpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGFk
ZXYtPnZjbi5oYXJ2ZXN0X2NvbmZpZyAmICgxIDw8IGkpKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByaW5nc1tudW1fcmluZ3MrK10gPSAmYWRldi0+dmNuLmluc3Rbal0ucmlu
Z19kZWM7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJpbmdzW251bV9yaW5n
cysrXSA9ICZhZGV2LT52Y24uaW5zdFtpXS5yaW5nX2RlYzsKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIH0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGNhc2UgQU1ER1BVX0hXX0lQX1ZDTl9FTkM6Cj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBmb3IgKGogPSAwOyBqIDwgYWRldi0+dmNuLm51bV92Y25faW5zdDsgKytq
KSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChhZGV2LT52Y24uaGFy
dmVzdF9jb25maWcgJiAoMSA8PCBqKSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciAo
aSA9IDA7IGkgPCBhZGV2LT52Y24ubnVtX3Zjbl9pbnN0OyArK2kpIHsKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGFkZXYtPnZjbi5oYXJ2ZXN0X2NvbmZpZyAmICgxIDw8
IGkpKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRp
bnVlOwo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGsgPSAwOyBrIDwg
YWRldi0+dmNuLm51bV9lbmNfcmluZ3M7ICsraykKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByaW5nc1tudW1fcmluZ3MrK10gPSAKPj4+ICZhZGV2LT52Y24uaW5z
dFtqXS5yaW5nX2VuY1trXTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9y
IChqID0gMDsgaiA8IGFkZXYtPnZjbi5udW1fZW5jX3JpbmdzOyArK2opCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmluZ3NbbnVtX3JpbmdzKytdID0gCj4+PiAm
YWRldi0+dmNuLmluc3RbaV0ucmluZ19lbmNbal07Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBjYXNlIEFNREdQVV9IV19JUF9WQ05fSlBFRzoKPj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGZvciAoaiA9IDA7IGogPCBhZGV2LT5qcGVnLm51bV9qcGVnX2luc3Q7ICsraikg
ewo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoYWRldi0+dmNuLmhhcnZl
c3RfY29uZmlnICYgKDEgPDwgaikpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGkg
PSAwOyBpIDwgYWRldi0+anBlZy5udW1fanBlZ19pbnN0OyArK2kpIHsKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGFkZXYtPnZjbi5oYXJ2ZXN0X2NvbmZpZyAmICgxIDw8
IGkpKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRp
bnVlOwo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByaW5nc1tudW1fcmluZ3Mr
K10gPSAmYWRldi0+anBlZy5pbnN0W2pdLnJpbmdfZGVjOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByaW5nc1tudW1fcmluZ3MrK10gPSAmYWRldi0+anBlZy5pbnN0W2ldLnJp
bmdfZGVjOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgfQo+Pj4gLQo+Pj4gLcKg
wqDCoMKgwqDCoMKgIGZvciAoaiA9IDA7IGogPCBudW1fcmluZ3M7ICsraikgewo+Pj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFyaW5nc1tqXS0+YWRldikKPj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+PiArwqDCoMKgIH0KPj4+IMKgIC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJxc1tudW1fcnFzKytdID0gJnJpbmdzW2pdLT5zY2hlZC5zY2hlZF9y
cVtwcmlvcml0eV07Cj4+PiAtwqDCoMKgwqDCoMKgwqAgfQo+Pj4gK8KgwqDCoCBmb3IgKGkgPSAw
OyBpIDwgbnVtX3JpbmdzOyArK2kpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXJpbmdzW2ld
LT5hZGV2KQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+PiDCoCAtwqDC
oMKgwqDCoMKgwqAgZm9yIChqID0gMDsgaiA8IGFtZGdwdV9jdHhfbnVtX2VudGl0aWVzW2ldOyAr
K2opCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByID0gZHJtX3NjaGVkX2VudGl0eV9pbml0
KCZjdHgtPmVudGl0aWVzW2ldW2pdLmVudGl0eSwKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBycXMsIG51bV9ycXMsICZjdHgtPmd1aWx0eSk7
Cj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKHIpCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIGVycm9yX2NsZWFudXBfZW50aXRpZXM7Cj4+PiArwqDCoMKgwqDCoMKgwqAgcnFzW251bV9y
cXMrK10gPSAKPj4+ICZyaW5nc1tpXS0+c2NoZWQuc2NoZWRfcnFbY3R4LT5pbml0X3ByaW9yaXR5
XTsKPj4+IMKgwqDCoMKgwqAgfQo+Pj4gwqAgK8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwgYW1kZ3B1
X2N0eF9udW1fZW50aXRpZXNbaHdfaXBdOyArK2kpCj4+PiArwqDCoMKgwqDCoMKgwqAgciA9IGRy
bV9zY2hlZF9lbnRpdHlfaW5pdCgmY3R4LT5lbnRpdGllc1tod19pcF1baV0uZW50aXR5LAo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBycXMsIG51bV9ycXMsICZjdHgtPmd1aWx0
eSk7Cj4+PiArwqDCoMKgIGlmIChyKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyb3JfY2xl
YW51cF9lbnRpdGllczsKPj4+ICsKPj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IGFtZGdwdV9j
dHhfbnVtX2VudGl0aWVzW2h3X2lwXTsgKytpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGN0eC0+ZW50
aXRpZXNbaHdfaXBdW2ldLnNlcXVlbmNlID0gMTsKPj4+ICsKPj4+IMKgwqDCoMKgwqAgcmV0dXJu
IDA7Cj4+PiDCoCDCoCBlcnJvcl9jbGVhbnVwX2VudGl0aWVzOgo+Pj4gLcKgwqDCoCBmb3IgKGkg
PSAwOyBpIDwgbnVtX2VudGl0aWVzOyArK2kpCj4+PiAtIGRybV9zY2hlZF9lbnRpdHlfZGVzdHJv
eSgmY3R4LT5lbnRpdGllc1swXVtpXS5lbnRpdHkpOwo+Pj4gLcKgwqDCoCBrZnJlZShjdHgtPmVu
dGl0aWVzWzBdKTsKPj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IGFtZGdwdV9jdHhfbnVtX2Vu
dGl0aWVzW2h3X2lwXTsgKytpKQo+Pj4gKyBkcm1fc2NoZWRfZW50aXR5X2Rlc3Ryb3koJmN0eC0+
ZW50aXRpZXNbaHdfaXBdW2ldLmVudGl0eSk7Cj4+PiDCoCAtZXJyb3JfZnJlZV9mZW5jZXM6Cj4+
PiAtwqDCoMKgIGtmcmVlKGN0eC0+ZmVuY2VzKTsKPj4+IC3CoMKgwqAgY3R4LT5mZW5jZXMgPSBO
VUxMOwo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gcjsKPj4+IMKgIH0KPj4+IMKgIC1zdGF0aWMgdm9p
ZCBhbWRncHVfY3R4X2Zpbmkoc3RydWN0IGtyZWYgKnJlZikKPj4+IC17Cj4+PiAtwqDCoMKgIHN0
cnVjdCBhbWRncHVfY3R4ICpjdHggPSBjb250YWluZXJfb2YocmVmLCBzdHJ1Y3QgYW1kZ3B1X2N0
eCwgCj4+PiByZWZjb3VudCk7Cj4+PiAtwqDCoMKgIHVuc2lnbmVkIG51bV9lbnRpdGllcyA9IGFt
ZGdwdV9jdHhfdG90YWxfbnVtX2VudGl0aWVzKCk7Cj4+PiAtwqDCoMKgIHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2ID0gY3R4LT5hZGV2Owo+Pj4gLcKgwqDCoCB1bnNpZ25lZCBpLCBqOwo+Pj4g
LQo+Pj4gLcKgwqDCoCBpZiAoIWFkZXYpCj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4g
LQo+Pj4gLcKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgbnVtX2VudGl0aWVzOyArK2kpCj4+PiAtwqDC
oMKgwqDCoMKgwqAgZm9yIChqID0gMDsgaiA8IGFtZGdwdV9zY2hlZF9qb2JzOyArK2opCj4+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KGN0eC0+ZW50aXRpZXNbMF1baV0u
ZmVuY2VzW2pdKTsKPj4+IC3CoMKgwqAga2ZyZWUoY3R4LT5mZW5jZXMpOwo+Pj4gLcKgwqDCoCBr
ZnJlZShjdHgtPmVudGl0aWVzWzBdKTsKPj4+IC0KPj4+IC3CoMKgwqAgbXV0ZXhfZGVzdHJveSgm
Y3R4LT5sb2NrKTsKPj4+IC0KPj4+IC3CoMKgwqAga2ZyZWUoY3R4KTsKPj4+IC19Cj4+PiAtCj4+
PiDCoCBpbnQgYW1kZ3B1X2N0eF9nZXRfZW50aXR5KHN0cnVjdCBhbWRncHVfY3R4ICpjdHgsIHUz
MiBod19pcCwgdTMyIAo+Pj4gaW5zdGFuY2UsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdTMyIHJpbmcsIHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICoqZW50aXR5KQo+Pj4gwqAg
ewo+Pj4gK8KgwqDCoCBpbnQgcjsKPj4+ICsKPj4+IMKgwqDCoMKgwqAgaWYgKGh3X2lwID49IEFN
REdQVV9IV19JUF9OVU0pIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoInVua25v
d24gSFcgSVAgdHlwZTogJWRcbiIsIGh3X2lwKTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gLUVJTlZBTDsKPj4+IEBAIC0yNDQsNiArMjU3LDEzIEBAIGludCBhbWRncHVfY3R4X2dldF9l
bnRpdHkoc3RydWN0IGFtZGdwdV9jdHggCj4+PiAqY3R4LCB1MzIgaHdfaXAsIHUzMiBpbnN0YW5j
ZSwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+IMKgwqDCoMKgwqAg
fQo+Pj4gwqAgK8KgwqDCoCBpZiAoY3R4LT5lbnRpdGllc1tod19pcF1bcmluZ10uc2VxdWVuY2Ug
PT0gLTEpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCByID0gYW1kZ3B1X2N0eF9pbml0X2VudGl0eShj
dHgsIGh3X2lwKTsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocikKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiByOwo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiDCoMKgwqDC
oMKgICplbnRpdHkgPSAmY3R4LT5lbnRpdGllc1tod19pcF1bcmluZ10uZW50aXR5Owo+Pj4gwqDC
oMKgwqDCoCByZXR1cm4gMDsKPj4+IMKgIH0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4gYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlv
bi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJG
bWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wMiU3QzAxJTdDTmlybW95LkRh
cyU0MGFtZC5jb20lN0M2YTVkNWJkODRmYTQ0NzE2MDk0MDA4ZDc3MjU1NmJiZiU3QzNkZDg5NjFm
ZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzcxMDM1ODM1MjcwOTE5NjEmYW1w
O3NkYXRhPWlJdk5Uc1BIbFlhMHhvYXlDalZKTVo0Y2dCaGh2SWE2aFZLZm1VWVloYlklM0QmYW1w
O3Jlc2VydmVkPTAgCj4+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
