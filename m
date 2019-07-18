Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB02A6CB9F
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 11:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714256E357;
	Thu, 18 Jul 2019 09:16:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810058.outbound.protection.outlook.com [40.107.81.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909196E357
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 09:16:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjxcZOChEf3ulW4CR+EDkyTqPhTPcaRvyzPdxI5Mq2lLx+jmeS89jBPiwL7TYGBaEQbGVATUP0Qv/qKG1sM1tGsOuA8a9ajzcL+0XXpvT0vCDKkHDOxjx5eIWl3Ydk9o/+rZE0Fb7Uk3IO2kawCatSixqruOSi2RGLLzuh+0wpCsqX2wCYUlehQJsDfwlPeuejWKWPoeNZkyC0/86qmQuZ2Ll5xB6ALm5rdCN6axU6fgALIMHdK/+xl9yImYZaZL8r2YSnp2ZwjcKQmPBDQIxRAFYEuI64GsXju6kDmTgDLoucvoHso16OQe4bzUNQ+qMK9zBP/o8b1fv8vXUerulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Q2J1cCtQr8jUF0kiB8WLMPYcsV23h7jFsWhPAcPK34=;
 b=Qd+MeF9IBsM7N7wUBMqZr0GiYNnOc9gVZ6qFGeaF/tCjs8hlPemrsipBQKHh6jQjUygNkTDxegiIi2Co8lv5xZPpuyeBJVJX+goE4VrnlLB9kjCJHDQvbWvQKiawptrKTyIuGspgwA8rqSB9+ixTjxexueFwfdoO5I1vxfGU2H59uLnvoaMKxM1agD8I9nBRd5I3ESUUNzzKHb0JKTN3g0dYpJr6lUyqAyz/h+A9KYmMupi2FfxgbDRpluagzndeuyQ9wmJO31CRP/DW+hDjB998rdjp9gQ0K/SrNMgzxfqHkXqisLmHVftsO9viEBYpMKLyPCr5km3SIoLwkJmPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1466.namprd12.prod.outlook.com (10.172.38.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 09:16:00 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::1550:bfd9:51c1:ad2]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::1550:bfd9:51c1:ad2%4]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 09:16:00 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Cui, Flora" <Flora.Cui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH libdrm 2/2] tests/amdgpu: add gpu reset test
Thread-Topic: [PATCH libdrm 2/2] tests/amdgpu: add gpu reset test
Thread-Index: AQHVPUBbL8eyrBJ6t0mxSzy+XnF/zabQGCvQ
Date: Thu, 18 Jul 2019 09:16:00 +0000
Message-ID: <DM5PR12MB1418B05E3847CE93387B5B02FCC80@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1563437433-4157-1-git-send-email-flora.cui@amd.com>
 <1563437433-4157-2-git-send-email-flora.cui@amd.com>
In-Reply-To: <1563437433-4157-2-git-send-email-flora.cui@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 320873d7-e2ab-4a1a-42a3-08d70b608d29
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1466; 
x-ms-traffictypediagnostic: DM5PR12MB1466:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1466F4210591CB12C70D7D52FCC80@DM5PR12MB1466.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(396003)(39850400004)(376002)(13464003)(189003)(199004)(186003)(966005)(446003)(4326008)(8676002)(66946007)(52536014)(66556008)(229853002)(86362001)(64756008)(66446008)(71200400001)(6436002)(316002)(68736007)(476003)(6506007)(102836004)(2501003)(5660300002)(71190400001)(14444005)(305945005)(256004)(110136005)(26005)(478600001)(33656002)(7736002)(55016002)(81166006)(53936002)(81156014)(6246003)(66066001)(6306002)(9686003)(53546011)(11346002)(99286004)(25786009)(7696005)(14454004)(8936002)(74316002)(76176011)(6116002)(76116006)(66476007)(486006)(2906002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1466;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3EjYnWOuVFmbLwFbREjnVMJIrsTFacI0qsFhjTjma7b0i855JhPa7lod3jnq+99GQMPIWHWW9ZvB6j+S01JqEBX0YJPe+7BW0pNpOEZiGGltwvRApXPyg9AefkeimnQOC1a0OSwt1GE/HQGLNRmbettk6XFKY3jTOb7l/xaBf6DmjsWC4DPYo1tDg2jk+SVnW82IhWbVO3Y/FnyA2q+re+7QRWNOiFmiI/Ug89q8yWTr2SpKcDa3XHbRbvo8l3rvUT2EoBUr8P1DZyuVoCYIYy6bHeL8XKiq/M3rRlXQrEjkKTA8p7LOi+Sr0tBPIcjCaZFY8UtTEV/V0e8Q4230EQ/Noupl5OifGkUA2frcgo6vTUjmq57T12/rRMb5vDGJGQ0bktkA4EmtUFEbtar1LJFZzzbZ2C9/IhMh34bJ9o8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 320873d7-e2ab-4a1a-42a3-08d70b608d29
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 09:16:00.7910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1466
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Q2J1cCtQr8jUF0kiB8WLMPYcsV23h7jFsWhPAcPK34=;
 b=jWhSU7U25FiKShJLv08nQ5kqqSBVz8HQe1siZzvT4rdulzsOqFwPifim2ZuCz6SBDE/g5QT3RksxivjHB+949NZtioGDOeQHKRqpfu1DNqkHQOg4bcVOyde0TlX1ujtyBJIxwJVvRZE3vucbmo6cRuaMCl+KCRA0tR49p0KF3Ps=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzOg0KDQpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0Bh
bWQuY29tPg0KDQpSZWdhcmRzLA0KSGF3a2luZw0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9u
IEJlaGFsZiBPZiBDdWksIEZsb3JhDQpTZW50OiAyMDE55bm0N+aciDE45pelIDE2OjExDQpUbzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBDdWksIEZsb3JhIDxGbG9yYS5DdWlA
YW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCBsaWJkcm0gMi8yXSB0ZXN0cy9hbWRncHU6IGFkZCBn
cHUgcmVzZXQgdGVzdA0KDQoxLiBwZXJmb3JtIGdwdSByZXNldA0KMi4gcGVyZm9ybSBkaXNwYXRj
aCB0ZXN0IHRvIHZlcmlmeSBncHUgcmVzZXQgdG8gYSBnb29kIHN0YXRlDQoNCkNoYW5nZS1JZDog
STRiYmEwZDFiODI5Mjg4YmJhN2I2ODg1ZDdlNjhjOGY2OWVmOGY0YjUNClNpZ25lZC1vZmYtYnk6
IEZsb3JhIEN1aSA8ZmxvcmEuY3VpQGFtZC5jb20+DQotLS0NCiB0ZXN0cy9hbWRncHUvYW1kZ3B1
X3Rlc3QuYyB8ICA1ICsrKysrDQogdGVzdHMvYW1kZ3B1L2Jhc2ljX3Rlc3RzLmMgfCAzOCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgNDMg
aW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvdGVzdHMvYW1kZ3B1L2FtZGdwdV90ZXN0LmMg
Yi90ZXN0cy9hbWRncHUvYW1kZ3B1X3Rlc3QuYyBpbmRleCA3MzQwM2ZiLi4wYzkzNjRhIDEwMDY0
NA0KLS0tIGEvdGVzdHMvYW1kZ3B1L2FtZGdwdV90ZXN0LmMNCisrKyBiL3Rlc3RzL2FtZGdwdS9h
bWRncHVfdGVzdC5jDQpAQCAtNDcyLDYgKzQ3MiwxMSBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZGlz
YWJsZV9zdWl0ZXMoKQ0KIAlpZiAoZmFtaWx5X2lkIDwgQU1ER1BVX0ZBTUlMWV9BSSB8fCBmYW1p
bHlfaWQgPiBBTURHUFVfRkFNSUxZX1JWKQ0KIAkJaWYgKGFtZGdwdV9zZXRfdGVzdF9hY3RpdmUo
QkFTSUNfVEVTVFNfU1RSLCAiRHJhdyBUZXN0IiwgQ1VfRkFMU0UpKQ0KIAkJCWZwcmludGYoc3Rk
ZXJyLCAidGVzdCBkZWFjdGl2YXRpb24gZmFpbGVkIC0gJXNcbiIsIENVX2dldF9lcnJvcl9tc2co
KSk7DQorDQorCS8qIFRoaXMgdGVzdCB3YXMgcmFuIG9uIEdGWDkgb25seSAqLw0KKwlpZiAoZmFt
aWx5X2lkIDwgQU1ER1BVX0ZBTUlMWV9BSSB8fCBmYW1pbHlfaWQgPiBBTURHUFVfRkFNSUxZX1JW
KQ0KKwkJaWYgKGFtZGdwdV9zZXRfdGVzdF9hY3RpdmUoQkFTSUNfVEVTVFNfU1RSLCAiR1BVIHJl
c2V0IFRlc3QiLCBDVV9GQUxTRSkpDQorCQkJZnByaW50ZihzdGRlcnIsICJ0ZXN0IGRlYWN0aXZh
dGlvbiBmYWlsZWQgLSAlc1xuIiwgDQorQ1VfZ2V0X2Vycm9yX21zZygpKTsNCiB9DQogDQogLyog
VGhlIG1haW4oKSBmdW5jdGlvbiBmb3Igc2V0dGluZyB1cCBhbmQgcnVubmluZyB0aGUgdGVzdHMu
DQpkaWZmIC0tZ2l0IGEvdGVzdHMvYW1kZ3B1L2Jhc2ljX3Rlc3RzLmMgYi90ZXN0cy9hbWRncHUv
YmFzaWNfdGVzdHMuYyBpbmRleCA4ZmE3MDg4Li5jMDRkZjhiIDEwMDY0NA0KLS0tIGEvdGVzdHMv
YW1kZ3B1L2Jhc2ljX3Rlc3RzLmMNCisrKyBiL3Rlc3RzL2FtZGdwdS9iYXNpY190ZXN0cy5jDQpA
QCAtMjQsNiArMjQsOSBAQA0KICNpbmNsdWRlIDxzdGRpby5oPg0KICNpbmNsdWRlIDxzdGRsaWIu
aD4NCiAjaW5jbHVkZSA8dW5pc3RkLmg+DQorI2luY2x1ZGUgPHN5cy90eXBlcy5oPg0KKyNpbmNs
dWRlIDxzeXMvc3RhdC5oPg0KKyNpbmNsdWRlIDxmY250bC5oPg0KICNpZmRlZiBIQVZFX0FMTE9D
QV9IDQogIyBpbmNsdWRlIDxhbGxvY2EuaD4NCiAjZW5kaWYNCkBAIC01MSw2ICs1NCw3IEBAIHN0
YXRpYyB2b2lkIGFtZGdwdV9zeW5jX2RlcGVuZGVuY3lfdGVzdCh2b2lkKTsNCiBzdGF0aWMgdm9p
ZCBhbWRncHVfYm9fZXZpY3Rpb25fdGVzdCh2b2lkKTsgIHN0YXRpYyB2b2lkIGFtZGdwdV9kaXNw
YXRjaF90ZXN0KHZvaWQpOyAgc3RhdGljIHZvaWQgYW1kZ3B1X2RyYXdfdGVzdCh2b2lkKTsNCitz
dGF0aWMgdm9pZCBhbWRncHVfZ3B1X3Jlc2V0X3Rlc3Qodm9pZCk7DQogDQogc3RhdGljIHZvaWQg
YW1kZ3B1X2NvbW1hbmRfc3VibWlzc2lvbl93cml0ZV9saW5lYXJfaGVscGVyKHVuc2lnbmVkIGlw
X3R5cGUpOyAgc3RhdGljIHZvaWQgYW1kZ3B1X2NvbW1hbmRfc3VibWlzc2lvbl9jb25zdF9maWxs
X2hlbHBlcih1bnNpZ25lZCBpcF90eXBlKTsgQEAgLTc0LDYgKzc4LDcgQEAgQ1VfVGVzdEluZm8g
YmFzaWNfdGVzdHNbXSA9IHsNCiAJeyAiU3luYyBkZXBlbmRlbmN5IFRlc3QiLCAgYW1kZ3B1X3N5
bmNfZGVwZW5kZW5jeV90ZXN0IH0sDQogCXsgIkRpc3BhdGNoIFRlc3QiLCAgYW1kZ3B1X2Rpc3Bh
dGNoX3Rlc3QgfSwNCiAJeyAiRHJhdyBUZXN0IiwgIGFtZGdwdV9kcmF3X3Rlc3QgfSwNCisJeyAi
R1BVIHJlc2V0IFRlc3QiLCBhbWRncHVfZ3B1X3Jlc2V0X3Rlc3QgfSwNCiAJQ1VfVEVTVF9JTkZP
X05VTEwsDQogfTsNCiAjZGVmaW5lIEJVRkZFUl9TSVpFICg4ICogMTAyNCkNCkBAIC0zMTMxLDMg
KzMxMzYsMzYgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RyYXdfdGVzdCh2b2lkKQ0KIAkJYW1kZ3B1
X21lbWNweV9kcmF3X3Rlc3QoZGV2aWNlX2hhbmRsZSwgcmluZ19pZCk7DQogCX0NCiB9DQorDQor
c3RhdGljIHZvaWQgYW1kZ3B1X2dwdV9yZXNldF90ZXN0KHZvaWQpIHsNCisJaW50IHI7DQorCWNo
YXIgZGVidWdmc19wYXRoWzI1Nl0sIHRtcFsxMF07DQorCWludCBmZDsNCisJc3RydWN0IHN0YXQg
c2J1ZjsNCisJYW1kZ3B1X2NvbnRleHRfaGFuZGxlIGNvbnRleHRfaGFuZGxlOw0KKwl1aW50MzJf
dCBoYW5nX3N0YXRlLCBoYW5nczsNCisNCisJciA9IGFtZGdwdV9jc19jdHhfY3JlYXRlKGRldmlj
ZV9oYW5kbGUsICZjb250ZXh0X2hhbmRsZSk7DQorCUNVX0FTU0VSVF9FUVVBTChyLCAwKTsNCisN
CisJciA9IGZzdGF0KGRybV9hbWRncHVbMF0sICZzYnVmKTsNCisJQ1VfQVNTRVJUX0VRVUFMKHIs
IDApOw0KKw0KKwlzcHJpbnRmKGRlYnVnZnNfcGF0aCwgIi9zeXMva2VybmVsL2RlYnVnL2RyaS8l
ZC9hbWRncHVfZ3B1X3JlY292ZXIiLCBtaW5vcihzYnVmLnN0X3JkZXYpKTsNCisJZmQgPSBvcGVu
KGRlYnVnZnNfcGF0aCwgT19SRE9OTFkpOw0KKwlDVV9BU1NFUlQoZmQgPj0gMCk7DQorDQorCXIg
PSByZWFkKGZkLCB0bXAsIHNpemVvZih0bXApL3NpemVvZihjaGFyKSk7DQorCUNVX0FTU0VSVChy
ID4gMCk7DQorDQorCXIgPSBhbWRncHVfY3NfcXVlcnlfcmVzZXRfc3RhdGUoY29udGV4dF9oYW5k
bGUsICZoYW5nX3N0YXRlLCAmaGFuZ3MpOw0KKwlDVV9BU1NFUlRfRVFVQUwociwgMCk7DQorCUNV
X0FTU0VSVF9FUVVBTChoYW5nX3N0YXRlLCBBTURHUFVfQ1RYX1VOS05PV05fUkVTRVQpOw0KKw0K
KwljbG9zZShmZCk7DQorCXIgPSBhbWRncHVfY3NfY3R4X2ZyZWUoY29udGV4dF9oYW5kbGUpOw0K
KwlDVV9BU1NFUlRfRVFVQUwociwgMCk7DQorDQorCWFtZGdwdV9kaXNwYXRjaF90ZXN0KCk7DQor
fQ0KLS0NCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
