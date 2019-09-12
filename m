Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181FAB07D1
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 06:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0513A6EC8A;
	Thu, 12 Sep 2019 04:13:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700050.outbound.protection.outlook.com [40.107.70.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667DC6E029
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 02:38:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=in7nFTIApdoy1hE0eliTGuhf++2wIez7IRkRca30tUVwE2kql5UPkiZEzftQFeg7aZlo6xTY9WGdIuVlx21bO9io3vf4j/2URus+cR1VGfZi3elJ53dCaizBCXTT996+PIoHv/PexIS4qO7jApULeGAWZcy1xb3v3vuQveNUIqJmegZKlm7lUC7GlwR3Nkl4lKM4vActSbFYIvrcGBm0EhuDS8tPZ/MLasPZrOipctkoqNrVaQmxj3b9TSVqkXLM9NiVwnPg5UlXx3XDOSag1MBVmo+mRMGt6chVOZAC3itTXHnsHGAS8ny12SxIXabtQvYgbZEuS/6SGntH0ucTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCG57XvX8iops8zL6Sr/tTkUanmnFTuXbrfZ8cB4SAQ=;
 b=hLgRWZotpnff+v48zEpmXshxeEe/lbbiyGofO1vZKjQxqLBlo25iydL0ssinbFDkxAH9HUIv4M/xXScDq173aG8goR9crUvoyYGfOpeR5ATKbjdlOEa2S5DVNIZtH8baKX0peB7BvjxVjbSwpSnvn7yyMKA5LTAEwk0f+s/Asl+dII6UjjA9JDuwdwBhDusY2xyJD9ZmJ3zrRgNlXJv9wFTE91hBL4SlKWYUmhk7wmujMGoDV2jFwlPVOWGCd03/2gK5UMRTsyf5/43ABUVx/apFR06eHx+MYiP8XzPDUVkdlKw4Jzbc33irCwpA5XevfLm6Ah5CPTgWG0eVVR8+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3870.namprd12.prod.outlook.com (10.255.237.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Thu, 12 Sep 2019 02:38:03 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2241.018; Thu, 12 Sep 2019
 02:38:03 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/amdgpu: power up sdma_v4 for resume back period
Thread-Topic: [PATCH] drm/amd/amdgpu: power up sdma_v4 for resume back period
Thread-Index: AQHVaQ2tEwQt0N37/UeTBpEL38+E2KcnTo+AgAADsAA=
Date: Thu, 12 Sep 2019 02:38:03 +0000
Message-ID: <MN2PR12MB3536FDB1809B6851290723B8FBB00@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <1568253538-27220-1-git-send-email-Prike.Liang@amd.com>
 <MN2PR12MB334464D43A27239078B7F728E4B00@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB334464D43A27239078B7F728E4B00@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a968343-e250-4117-7311-08d7372a3c7c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3870; 
x-ms-traffictypediagnostic: MN2PR12MB3870:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB38708C0CFD39F9E31B146036FBB00@MN2PR12MB3870.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(13464003)(52314003)(199004)(189003)(476003)(7736002)(2501003)(305945005)(478600001)(2906002)(6436002)(186003)(66066001)(74316002)(256004)(486006)(229853002)(8676002)(99286004)(5660300002)(8936002)(14454004)(52536014)(81156014)(33656002)(76176011)(81166006)(7696005)(66556008)(66946007)(64756008)(66476007)(66446008)(6246003)(102836004)(9686003)(11346002)(53936002)(6116002)(53546011)(6506007)(446003)(76116006)(55016002)(3846002)(54906003)(316002)(26005)(71200400001)(110136005)(25786009)(71190400001)(86362001)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3870;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MZL2+2zcYJDfkcsVfXbiBUCrqIMU+RZXB7UrMZ/YLdVsYiFtunw7B5LqdgR8qqS4qtEtzzrZMepOxk8gMhcqsKdAYA6NGHwGABjg2r4kT0UQP2PoPM8R8IOVEFv2QE7Pgj3dIe3PhSpQFdQeMff+PKVaUZ+TNVISmfGG4wieS3xdcb+kAS/HxaFj7lq7g4GGy3sUg8o0X1rX2kDId9b8T4TSyTfWthEQHbakR8tY9vL8XV+7QHaP1F2MIXbgYZguJp0ATtYZBYKluH9nVguWSbMA8vIV9dA/Y28SOEvfvuz2b0kW2Jfgo8bnVhojVjIGAvSGNp1fSic6dYdT7HGGSfevtEliMtxe68N7CvQdTrgkmQMYQUDchz3Ev+Xx6Rqz0imi6shmBkuOzRt/m5RJUlzJ20iIHnVGm5ZDNpfVz+g=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a968343-e250-4117-7311-08d7372a3c7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 02:38:03.7368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PPsVgTJcNjZj4AQPaekAIYWfnN5ub2dS/Hhg/w/J+Pt3Gh2J1pe4BPSq2y2VIBRi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3870
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCG57XvX8iops8zL6Sr/tTkUanmnFTuXbrfZ8cB4SAQ=;
 b=VD9Xq79zqjfZaFPtEfw8lggXDu3T9dGz2+LzxpbVLMJ6Gz6FPWBR13KUTFMPYhFQ6s3FYFeMA9xg9UUcizDEUkbRdKYX1QOq8kefSFufNBJ72KlG0Qbq4xb3kTxPghj6kpthsId/wqlgj9kN4APTlUZ6N/bZAxdxJc1+TtbRSLE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIHJldmlldyBhbmQgb3JpZ2luYWxseSB3YW50IGVtcGhhc2l6ZSB0aGUgc2VxdWVuY2Ug
b25seSBuZWVkZWQgYXQgc2RtYSB2NCBjYXNlLgogClRoYW5rcywKUHJpa2UKPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPgo+
IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTIsIDIwMTkgMTA6MjAgQU0KPiBUbzogTGlhbmcs
IFByaWtlIDxQcmlrZS5MaWFuZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogRmVuZywgS2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+OyBIdWFuZywgUmF5
Cj4gPFJheS5IdWFuZ0BhbWQuY29tPjsgTGl1LCBBYXJvbiA8QWFyb24uTGl1QGFtZC5jb20+Cj4g
U3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZC9hbWRncHU6IHBvd2VyIHVwIHNkbWFfdjQgZm9y
IHJlc3VtZSBiYWNrCj4gcGVyaW9kCj4gCj4gSXQncyBiZXR0ZXIgdG8gc2F5ICJzZG1hIGVuZ2lu
ZSIgb3IganVzdCAic2RtYSIgaW5zdGVhZCBvZiAic2RtYV92NCIuCj4gQW55d2F5LCB0aGUgcGF0
Y2ggaXMgcmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Cj4gCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBMaWFuZywgUHJpa2UgPFByaWtlLkxpYW5n
QGFtZC5jb20+Cj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxMiwgMjAxOSA5OjU5IEFNCj4g
VG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IFF1YW4sIEV2YW4gPEV2YW4u
UXVhbkBhbWQuY29tPjsgRmVuZywgS2VubmV0aAo+IDxLZW5uZXRoLkZlbmdAYW1kLmNvbT47IEh1
YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgTGl1LCBBYXJvbgo+IDxBYXJvbi5MaXVAYW1k
LmNvbT47IExpYW5nLCBQcmlrZSA8UHJpa2UuTGlhbmdAYW1kLmNvbT4KPiBTdWJqZWN0OiBbUEFU
Q0hdIGRybS9hbWQvYW1kZ3B1OiBwb3dlciB1cCBzZG1hX3Y0IGZvciByZXN1bWUgYmFjawo+IHBl
cmlvZAo+IAo+IFRoZSBzZG1hX3Y0IHNob3VsZCBiZSB1bmdhdGVkIHdoZW4gdGhlIElQIHJlc3Vt
ZSBiYWNrLCBvdGhlcndpc2UgaXQgd2lsbAo+IGhhbmcgdXAgYW5kIHJlc3VtZSB0aW1lIG91dCBl
cnJvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2UuTGlhbmdAYW1kLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RwbS5jICAgIHwg
IDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgICAgIHwgMTAg
KysrKysrLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMg
fCAgMyArKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHBtLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcG0uYwo+IGluZGV4
IDM1N2U0NWYuLjI2MzI2NTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RwbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RwbS5jCj4gQEAgLTk1MSw2ICs5NTEsNyBAQCBpbnQgYW1kZ3B1X2RwbV9zZXRfcG93ZXJnYXRp
bmdfYnlfc211KHN0cnVjdAo+IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IGJsb2NrCj4g
IAljYXNlIEFNRF9JUF9CTE9DS19UWVBFX1VWRDoKPiAgCWNhc2UgQU1EX0lQX0JMT0NLX1RZUEVf
VkNOOgo+ICAJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9WQ0U6Cj4gKwljYXNlIEFNRF9JUF9CTE9D
S19UWVBFX1NETUE6Cj4gIAkJaWYgKHN3c211KQo+ICAJCQlyZXQgPSBzbXVfZHBtX3NldF9wb3dl
cl9nYXRlKCZhZGV2LT5zbXUsCj4gYmxvY2tfdHlwZSwgZ2F0ZSk7Cj4gIAkJZWxzZQo+IEBAIC05
NTksNyArOTYwLDYgQEAgaW50IGFtZGdwdV9kcG1fc2V0X3Bvd2VyZ2F0aW5nX2J5X3NtdShzdHJ1
Y3QKPiBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCBibG9jawo+ICAJCWJyZWFrOwo+ICAJ
Y2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9HTUM6Cj4gIAljYXNlIEFNRF9JUF9CTE9DS19UWVBFX0FD
UDoKPiAtCWNhc2UgQU1EX0lQX0JMT0NLX1RZUEVfU0RNQToKPiAgCQlyZXQgPSAoKGFkZXYpLT5w
b3dlcnBsYXkucHBfZnVuY3MtCj4gPnNldF9wb3dlcmdhdGluZ19ieV9zbXUoCj4gIAkJCQkoYWRl
diktPnBvd2VycGxheS5wcF9oYW5kbGUsIGJsb2NrX3R5cGUsCj4gZ2F0ZSkpOwo+ICAJCWJyZWFr
Owo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwo+
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKPiBpbmRleCBkMDE5Yjg1
Li5iNTM2ZjA0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFf
djRfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKPiBA
QCAtMTgwMSw4ICsxODAxLDkgQEAgc3RhdGljIGludCBzZG1hX3Y0XzBfaHdfaW5pdCh2b2lkICpo
YW5kbGUpCj4gIAlpbnQgcjsKPiAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVj
dCBhbWRncHVfZGV2aWNlICopaGFuZGxlOwo+IAo+IC0JaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBD
SElQX1JBVkVOICYmIGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcwo+ICYmCj4gLQkJCWFkZXYtPnBv
d2VycGxheS5wcF9mdW5jcy0KPiA+c2V0X3Bvd2VyZ2F0aW5nX2J5X3NtdSkKPiArCWlmICgoYWRl
di0+YXNpY190eXBlID09IENISVBfUkFWRU4gJiYgYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzCj4g
JiYKPiArCQkJYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLQo+ID5zZXRfcG93ZXJnYXRpbmdfYnlf
c211KSB8fAo+ICsJCQlhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SRU5PSVIpCj4gIAkJYW1kZ3B1
X2RwbV9zZXRfcG93ZXJnYXRpbmdfYnlfc211KGFkZXYsCj4gQU1EX0lQX0JMT0NLX1RZUEVfU0RN
QSwgZmFsc2UpOwo+IAo+ICAJaWYgKCFhbWRncHVfc3Jpb3ZfdmYoYWRldikpCj4gQEAgLTE4Mjks
OCArMTgzMCw5IEBAIHN0YXRpYyBpbnQgc2RtYV92NF8wX2h3X2Zpbmkodm9pZCAqaGFuZGxlKQo+
ICAJc2RtYV92NF8wX2N0eF9zd2l0Y2hfZW5hYmxlKGFkZXYsIGZhbHNlKTsKPiAgCXNkbWFfdjRf
MF9lbmFibGUoYWRldiwgZmFsc2UpOwo+IAo+IC0JaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQ
X1JBVkVOICYmIGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcwo+IC0JCQkmJiBhZGV2LT5wb3dlcnBs
YXkucHBfZnVuY3MtCj4gPnNldF9wb3dlcmdhdGluZ19ieV9zbXUpCj4gKwlpZiAoKGFkZXYtPmFz
aWNfdHlwZSA9PSBDSElQX1JBVkVOICYmIGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcwo+ICsJCQkm
JiBhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtCj4gPnNldF9wb3dlcmdhdGluZ19ieV9zbXUpIHx8
Cj4gKwkJCWFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JFTk9JUikKPiAgCQlhbWRncHVfZHBtX3Nl
dF9wb3dlcmdhdGluZ19ieV9zbXUoYWRldiwKPiBBTURfSVBfQkxPQ0tfVFlQRV9TRE1BLCB0cnVl
KTsKPiAKPiAgCXJldHVybiAwOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9hbWRncHVfc211LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYwo+IGluZGV4IGUxOGJmY2UuLmE1ZmNhNTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCj4gQEAgLTQwMCw2ICs0MDAsOSBAQCBpbnQg
c211X2RwbV9zZXRfcG93ZXJfZ2F0ZShzdHJ1Y3Qgc211X2NvbnRleHQKPiAqc211LCB1aW50MzJf
dCBibG9ja190eXBlLAo+ICAJY2FzZSBBTURfSVBfQkxPQ0tfVFlQRV9HRlg6Cj4gIAkJcmV0ID0g
c211X2dmeF9vZmZfY29udHJvbChzbXUsIGdhdGUpOwo+ICAJCWJyZWFrOwo+ICsJY2FzZSBBTURf
SVBfQkxPQ0tfVFlQRV9TRE1BOgo+ICsJCXJldCA9IHNtdV9wb3dlcmdhdGVfc2RtYShzbXUsIGdh
dGUpOwo+ICsJCWJyZWFrOwo+ICAJZGVmYXVsdDoKPiAgCQlicmVhazsKPiAgCX0KPiAtLQo+IDIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
